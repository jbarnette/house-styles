require "app/jobs/mongo"

module App

  # Mark and hook a model class for async auditing.

  module Auditable
    EXCLUSIONS = %w(created_at updated_at).map &:intern
    REDACTED   = %w(hashword)

    def self.included model
      model.after_update  :audit
      model.after_destroy :audit
    end

    # Asynchronously save an audit record for this model instance. An
    # optional `verb` and verb-specific `data` can be provided to
    # track custom events, e.g.,
    #
    #     user.audit "signed-in"

    def audit verb = nil, data = nil
      extras = nil

      if verb
        extras = { verb: verb }
        extras[:data] = data if data
      end

      account = App::Context.current.account
      user    = App::Context.current.user
      pk      = self.class.primary_key
      delta   = changes.except pk, *EXCLUSIONS if persisted?

      # Fail fast: If there's a delta, it's empty, and there are no
      # extras to be merged, there's no need to audit. Have to check
      # delta presence and contents separately because a `nil` delta
      # is a delete.

      return if delta and delta.empty? and not extras

      data = {
        account: account && account.id,
        at:      Time.now.to_f,
        target:  id,
        user:    user && user.id
      }

      # If the delta exists, check it for anything sensitive that
      # needs to be redacted and then add it to the audit data.

      unless delta.empty?
        REDACTED.each do |k|
          delta[k] = ["REDACTED", "REDACTED"] if delta.include? k
        end

        data[:delta] = delta
      end

      data.merge! extras if extras
      App::Jobs::Mongo.enqueue "audits.#{self.class.name}", data

      nil
    end

    # A MongoDB cursor for this model's audits, most recent first.

    def audits criteria = {}
      $mongo["audits.#{self.class.name}"].
        find(criteria.merge target: id).sort [[:at, -1]]
    end
  end
end
