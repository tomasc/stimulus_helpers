# frozen_string_literal: true

module Modulor
  module StimulusHelper
    def stimulus_controller(controller_name)
      { controller: controller_name }
    end

    def stimulus_action(event, controller_name, action)
      { action: "#{event}->#{controller_name}##{action}" }
    end

    def stimulus_actions(*args)
      args.map { |a| stimulus_action(*a) }.each_with_object({ action: "" }) do |h, res|
        res[:action] = [res[:action], h[:action]].reject(&:blank?).join(" ")
      end
    end

    def stimulus_class(controller_name, name, value)
      { "#{controller_name}-#{name.to_s.dasherize}-class" => value }
    end

    def stimulus_params(controller_name, params)
      Hash(params).each_with_object({}) do |(name, value), res|
        res.merge!(stimulus_param(controller_name, name, value))
      end
    end

    def stimulus_param(controller_name, name, value)
      { "#{controller_name}-#{name.to_s.dasherize}-param" => value }
    end

    def stimulus_outlet(controller_name, outlet, selector)
      { "#{controller_name}-#{outlet.to_s.dasherize}-outlet" => selector }
    end

    def stimulus_target(controller_name, value)
      { "#{controller_name}-target" => value }
    end

    def stimulus_value(controller_name, name, value)
      case value
      when Array, Hash
        { "#{controller_name}-#{name.to_s.dasherize}-value" => value.to_json }
      else
        { "#{controller_name}-#{name.to_s.dasherize}-value" => value }
      end
    end
  end
end
