# StimulusHelpers

[![StimulusHelpers](https://github.com/tomasc/stimulus_helpers/actions/workflows/ruby.yml/badge.svg)](https://github.com/tomasc/stimulus_helpers/actions/workflows/ruby.yml)

Helpers to build stimulus controller attributes for use in views and controller-names.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add stimulus_helpers

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install stimulus_helpers

## Usage

Simply include the `StimulusHelpers` module:

```ruby
class MyClass
  include StimulusHelpers
end

# or

ActionView::Base.send :include, StimulusHelpers

# etc.
```

This will add the following helpers:

Controller:

```ruby
stimulus_controller("controller-name")
# => { "controller" => "controller-name" }
```

Action:

```ruby
stimulus_action("controller-name", "click", "open")
# => { "action" => "click->controller-name#open" }

stimulus_actions("controller-name", click: "open", blur: "close")
# => { "action" => "click->controller-name#open blur->controller-name#close" }
```

Class:

```ruby
stimulus_class("controller-name", "open", "controller-name--open")
# => { "controller-name-open-class" => "controller-name--open" }

stimulus_classes("controller-name", open: "controller-name--open", closed: "controller-name--closed")
# => { "controller-name-open-class" => "controller-name--open", "controller-name-closed-class" => "controller-name--closed" }
```

Value:

```ruby
stimulus_value("controller-name", "open", true)
# => { "controller-name-open-value" => "true" }

stimulus_values("controller-name", user: { name: "Jens" }, names: ["foo", "bar"])
# => { "controller-name-user-value" => "{\"name\":\"Jens\"}", "controller-name-names-value" => "[\"foo\",\"bar\"]" }
```

Target:

```ruby
stimulus_target("controller-name", :input)
# => { "controller-name-target" => "input" }
```

Param:

```ruby
stimulus_param("controller-name", "id", 123)
# => { "controller-name-id-param" => "123" }

stimulus_params("controller-name", id: 123, name: "Jens")
# => { "controller-name-id-param" => "123", "controller-name-name-param" => "Jens" }
```

Outlet:

```ruby
stimulus_outlet("controller-name", "result", ".result")
# => { "controller-name-result-outlet" => ".result" }

stimulus_outlets("controller-name", result: ".result", output: ".output")
# => { "controller-name-result-outlet" => ".result", "controller-name-output-outlet" => ".output" }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/stimulus_helpers.
