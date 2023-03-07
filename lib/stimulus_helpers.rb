# frozen_string_literal: true

require_relative "stimulus_helpers/version"
require "json"

module StimulusHelpers
  def stimulus_controller(controller)
    { controller: controller }
  end

  def stimulus_action(controller, actions = {})
    build_stimulus_action(controller: controller, actions: actions)
  end

  def stimulus_class(controller, classes = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: classes,
      type: "class"
    )
  end

  def stimulus_value(controller, values = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: values,
      type: "value"
    )
  end

  def stimulus_target(controller, target)
    build_stimulus_attribute(
      controller: controller,
      attributes: { target: target }
    )
  end

  def stimulus_param(controller, params = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: params,
      type: "param"
    )
  end

  def stimulus_outlet(controller, outlets = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: outlets,
      type: "outlet"
    )
  end

  private

  def build_stimulus_action(controller:, actions: {})
    action = actions.map do |action, listeners|
      Array(listeners).map do |listener|
        "#{action}->#{controller}##{listener}"
      end
    end.join(" ")
    { action: action }
  end

  def build_stimulus_attribute(controller:, type: nil, attributes: {})
    attributes.transform_keys! { |key| "#{key}-#{type}" } if type
    attributes.each_with_object({}) do |(key, value), res|
      value = value.to_json if value.is_a?(Array) || value.is_a?(Hash)
      res["#{controller}-#{key}"] = value.to_s
    end
  end
end
