# Audiosocket (Ruby)

This covers all Ruby code, no matter what framework or purpose. Tests,
migrations, and Rake tasks are code too.

Guidelines aren't laws. What's important is **overall consistency**.
Anybody's welcome to change these, just get consensus and make sure
**all the existing code** matches your new guideline.

## The Laws

Yup, guidelines aren't laws. These are, though:

* Follow these. If you see code that doesn't, fix it.
* Use your brain. Ignore the guidelines when it's appropriate.
* ...but not unilaterally.

## Invariants

* Wrap at 80 columns.
* Use vertical whitespace liberally (but only one line at a time).
  We're not going to run out.

## Classes and Modules

### Files

Unless it's a large collection of very small subclasses/modules, put
each class/module in its own file. Create the file name by translating
the CamelCased full name of the class/module to slashes and
underscores:

    App::Mediator::SomeModel -> app/mediator/some_model.rb
    
### Naming

Be explicit, but not verbose. Be specific, but describe purpose
instead of implementation. When naming abstract superclasses, prefer a
general noun to `Base`. When naming modules, try to describe the extra
behavior the module provides instead of falling back on nouns.

#### Bad (too verbose)

```ruby
class CollectionOfBlankets
  # ...
end
```

#### Better

```ruby
class Blankets
  # ...
end
```

#### Bad (specific implementation)

```ruby
class SHA1Fingerprinter
  # ...
end
```

### Better

```ruby
class Fingerprinter
  # ...
end
```

#### Bad (abuse of "Base")

```ruby
module Presenter
  class Base
    # ...
  end
end
```

#### Better

```ruby
class Presenter
  # ...
end
```

#### Bad (noun module)

```ruby
module EventEmitter
  # ...
end
```

#### Better

```ruby
module Watchable
  # ...
end
```

### Nesting

Explicitly nest subclasses/modules. Nesting exposes more secondary
information (which ancestors are classes and which are models) and
reduces order-of-require problems in some cases.

#### Bad

```ruby
class App::Mediator::SomeModel < Mediator
  # ...
end
```

#### Better

```ruby
module App
  class Mediator
    class SomeModel < Mediator
      # ...
    end
  end
end
```
