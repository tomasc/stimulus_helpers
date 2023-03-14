# frozen_string_literal: true

require_relative "stimulus_helpers/version"
require "active_support/core_ext/string/inflections"
require "json"

module StimulusHelpers
  # @see https://blog.saeloun.com/2021/09/28/ruby-allow-value-omission-in-hash-literals
  def stimulus_controller(controller)
    { controller: }
  end

  def stimulus_action(controller, action, listener)
    build_stimulus_action(controller:, actions: { action => listener })
  end

  def stimulus_actions(controller, actions = {})
    build_stimulus_action(controller:, actions:)
  end

  def stimulus_class(controller, name, value)
    build_stimulus_attribute(
      controller:,
      attributes: { name => value },
      type: "class"
    )
  end

  def stimulus_classes(controller, classes = {})
    build_stimulus_attribute(
      controller:,
      attributes: classes,
      type: "class"
    )
  end

  def stimulus_value(controller, name, value)
    build_stimulus_attribute(
      controller:,
      attributes: { name => value },
      type: "value"
    )
  end

  def stimulus_values(controller, values = {})
    build_stimulus_attribute(
      controller:,
      attributes: values,
      type: "value"
    )
  end

  def stimulus_target(controller, target)
    build_stimulus_attribute(
      controller:,
      attributes: { target: }
    )
  end

  def stimulus_param(controller, name, value)
    build_stimulus_attribute(
      controller:,
      attributes: { name => value },
      type: "param"
    )
  end

  def stimulus_params(controller, params = {})
    build_stimulus_attribute(
      controller:,
      attributes: params,
      type: "param"
    )
  end

  def stimulus_outlet(controller, name, value)
    build_stimulus_attribute(
      controller:,
      attributes: { name => value },
      type: "outlet"
    )
  end

  def stimulus_outlets(controller, outlets = {})
    build_stimulus_attribute(
      controller:,
      attributes: outlets,
      type: "outlet"
    )
  end

  private
    def build_stimulus_action(controller:, actions: {})
      action = actions.map do |action, listeners|
        Array(listeners).map do |listener|
          "#{action}->#{controller}##{listener}".html_safe
        end
      end.join(" ").html_safe
      { action: }
    end

    def build_stimulus_attribute(controller:, type: nil, attributes: {})
      attributes.transform_keys! { |key| "#{key}-#{type}" } if type
      attributes.each_with_object({}) do |(key, value), res|
        value = value.to_json if value.is_a?(Array) || value.is_a?(Hash)
        res["#{controller}-#{key.to_s.dasherize}"] = value.to_s
      end
    end
end
