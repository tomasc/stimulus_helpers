# frozen_string_literal: true

require_relative "stimulus_helpers/version"
require "active_support/core_ext/string/inflections"
require "json"

module StimulusHelpers
  # Cache for dasherized keys to avoid repeated string operations
  @dasherized_cache = {}
  @cache_mutex = Mutex.new

  class << self
    attr_reader :dasherized_cache, :cache_mutex
  end

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
      # Use string concatenation instead of array operations for better performance
      action_parts = []
      actions.each do |action_name, listeners|
        Array(listeners).each do |listener|
          action_parts << "#{action_name}->#{controller}##{listener}"
        end
      end
      { action: action_parts.join(" ") }
    end

    def build_stimulus_attribute(controller:, type: nil, attributes: {})
      # Pre-process keys and batch JSON serialization for better performance
      result = {}
      json_values = {}
      
      attributes.each do |key, value|
        # Build the final key once
        final_key = if type
          "#{controller}-#{cached_dasherize("#{key}-#{type}")}"
        else
          "#{controller}-#{cached_dasherize(key.to_s)}"
        end
        
        # Batch JSON serialization
        if value.is_a?(Array) || value.is_a?(Hash)
          json_values[final_key] = value
        else
          result[final_key] = value.to_s
        end
      end
      
      # Serialize all JSON values at once to reduce overhead
      json_values.each do |key, value|
        result[key] = value.to_json
      end
      
      result
    end

    def cached_dasherize(string)
      StimulusHelpers.cache_mutex.synchronize do
        StimulusHelpers.dasherized_cache[string] ||= string.dasherize
      end
    end
end
