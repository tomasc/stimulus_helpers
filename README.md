# StimulusHelpers

[![StimulusHelpers](https://github.com/tomasc/stimulus_helpers/actions/workflows/ruby.yml/badge.svg)](https://github.com/tomasc/stimulus_helpers/actions/workflows/ruby.yml)

Helpers to build stimulus controller attributes for use in views and components.

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

```ruby
stimulus_controller("component")
# => { "controller" => "component" }

stimulus_action("component", "click", "open")
# => { "action" => "click->component#open" }

stimulus_actions("component", click: "open", blur: "close")
# => { "action" => "click->component#open blur->component#close" }

stimulus_class("component", "open", "component--open")
# => { "component-open-class" => "component--open" }

stimulus_classes("component", open: "component--open", closed: "component--closed")
# => { "component-open-class" => "component--open", "component-closed-class" => "component--closed" }

stimulus_value("component", "open", true)
# => { "component-open-value" => "true" }

stimulus_values("component", user: { name: "Jens" }, names: ["foo", "bar"])
# => { "component-user-value" => "{\"name\":\"Jens\"}", "component-names-value" => "[\"foo\",\"bar\"]" }

stimulus_target("component", :input)
# => { "component-target" => "input" }

stimulus_param("component", "id", 123)
# => { "component-id-param" => "123" }

stimulus_params("component", id: 123, name: "Jens")
# => { "component-id-param" => "123", "component-name-param" => "Jens" }

stimulus_outlet("component", "result", ".result")
# => { "component-result-outlet" => ".result" }

stimulus_outlets("component", result: ".result", output: ".output")
# => { "component-result-outlet" => ".result", "component-output-outlet" => ".output" }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stimulus_helpers.
