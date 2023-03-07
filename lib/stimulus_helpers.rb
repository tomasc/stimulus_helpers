# frozen_string_literal: true

require_relative "stimulus_helpers/version"
require "active_support/core_ext/string/inflections"
require "json"

module StimulusHelpers
  def stimulus_controller(controller)
    { controller: controller }
  end

  def stimulus_action(controller, action, listener)
    build_stimulus_action(controller: controller, actions: { action => listener})
  end

  def stimulus_actions(controller, actions = {})
    build_stimulus_action(controller: controller, actions: actions)
  end

  def stimulus_class(controller, name, value)
    build_stimulus_attribute(
      controller: controller,
      attributes: { name => value },
      type: "class"
    )
  end

  def stimulus_classes(controller, classes = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: classes,
      type: "class"
    )
  end

  def stimulus_value(controller, name, value)
    build_stimulus_attribute(
      controller: controller,
      attributes: { name => value },
      type: "value"
    )
  end

  def stimulus_values(controller, values = {})
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

  def stimulus_param(controller, name, value)
    build_stimulus_attribute(
      controller: controller,
      attributes: { name => value },
      type: "param"
    )
  end

  def stimulus_params(controller, params = {})
    build_stimulus_attribute(
      controller: controller,
      attributes: params,
      type: "param"
    )
  end

  def stimulus_outlet(controller, name, value)
    build_stimulus_attribute(
      controller: controller,
      attributes: { name => value },
      type: "outlet"
    )
  end

  def stimulus_outlets(controller, outlets = {})
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
      res["#{controller}-#{key.to_s.dasherize}"] = value.to_s
    end
  end
end
