require "test_helper"

class StimulusHelped
  include StimulusHelpers
end

class StimulusHelpersTest < Minitest::Test
  def test_controller
    assert_equal dummy.stimulus_controller("foo"), { controller: "foo" }
  end

  def test_action
    assert_equal dummy.stimulus_action("controller", click: %w[hi goodbye], blur: "onBlur"), { action: "click->controller#hi click->controller#goodbye blur->controller#onBlur" }
  end

  def test_class
    assert_equal dummy.stimulus_class("controller", open: ".open", closed: ".closed"), { "controller-open-class" => ".open", "controller-closed-class" => ".closed" }
  end

  def test_value
    assert_equal dummy.stimulus_value("controller", open: true, closed: false, names: %w[foo bar]), { "controller-open-value" => "true", "controller-closed-value" => "false", "controller-names-value" => "[\"foo\",\"bar\"]" }
  end

  def test_target
    assert_equal dummy.stimulus_target("controller", :input), { "controller-target" => "input" }
  end

  def test_param
    assert_equal dummy.stimulus_param("controller", id: "123"), { "controller-id-param" => "123" }
  end

  def test_outlet
    assert_equal dummy.stimulus_outlet("controller", result: ".result"), { "controller-result-outlet" => ".result" }
  end

  private

  def dummy
    StimulusHelped.new
  end
end
