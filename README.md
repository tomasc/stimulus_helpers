# StimulusHelpers

Helpers to build stimulus controller attributes for use in views and components.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add stimulus_helpers

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install stimulus_helpers

## Usage

Simply include the `StimulusHelpers` module:

```ruby
class Component
  include StimulusHelpers
end
```

This will add the following helpers:

```ruby
component = Component.new

component.stimulus_controller("component")
# => { "controller" => "component" }

component.stimulus_action("component", "click", "open")
# => { "action" => "click->component#open" }

component.stimulus_actions("component", click: "open", blur: "close")
# => { "action" => "click->component#open blur->component#close" }

component.stimulus_class("component", "open", "component--open")
# => { "component-open-class" => "component--open" }

component.stimulus_classes("component", open: "component--open", closed: "component--closed")
# => { "component-open-class" => "component--open", "component-closed-class" => "component--closed" }

component.stimulus_value("component", "open", true)
# => { "component-open-value" => "true" }

component.stimulus_values("component", user: { name: "Jens" }, names: ["foo", "bar"])
# => { "component-user-value" => "{\"name\":\"Jens\"}", "component-names-value" => "[\"foo\",\"bar\"]" }

component.stimulus_target("component", :input)
# => { "component-target" => "input" }

component.stimulus_param("component", "id", 123)
# => { "component-id-param" => "123" }

component.stimulus_params("component", id: 123, name: "Jens")
# => { "component-id-param" => "123", "component-name-param" => "Jens" }

component.stimulus_outlet("component", "result", ".result")
# => { "component-result-outlet" => ".result" }

component.stimulus_outlets("component", result: ".result", output: ".output")
# => { "component-result-outlet" => ".result", "component-output-outlet" => ".output" }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stimulus_helpers.
