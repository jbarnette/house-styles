# Audiosocket (Ruby)

This covers all Ruby code, no matter what framework or purpose. Tests,
migrations, and Rake tasks are code too.

Guidelines aren't laws. What's important is **overall consistency**.
Anybody's welcome to change these, just get consensus and make sure
**all the existing code** matches your new guideline.

## The Laws

Yup, guidelines aren't laws. These are, though:

* Follow the guidelines consistently. If you see code that doesn't, fix it.
* Use your brain. Ignore the guidelines when it's appropriate.
* ...but not unilaterally.
* Obsess about this stuff. Make it damn near impossible to figure out
  who wrote any given line of code without source control.

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

    App::Mediator::SomeModel  # => app/mediator/some_model.rb
    
### Naming

#### Be explicit, but not verbose.

Verbose names are harder and more fatiguing to read. Too many verbose
names can also promote overreaction and abbreviation.

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

#### Be specific, but describe purpose instead of implementation.

Taking an extra second to think about the purpose and not the tools
makes it a lot easier to refactor later on. Think about switching your
hash algorithm, your queuing solution, etc.

```ruby
class SHA1Fingerprinter
  # ...
end
```

#### Better

```ruby
class Fingerprinter
  # ...
end
```

#### Prefer a general noun to "Base."

"Base" is like "Manager." They're both lazy, content-free names.

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

#### Favor adjectives when naming mixins.

This certainly isn't the case for all modules, but mixins should
generally be adding a category of structure or behavior to a class. If
it's a category of structure or behavior, you should be able to
describe it with an adjective.

```ruby
module EventSource
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
