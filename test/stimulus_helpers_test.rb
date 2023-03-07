require "test_helper"

class StimulusHelped
  include StimulusHelpers
end

class StimulusHelpersTest < Minitest::Test
  def test_controller
    assert_equal dummy.stimulus_controller("foo"), { controller: "foo" }
  end

  def test_action
    assert_equal dummy.stimulus_action("controller", "click", %w[hi goodbye]), { action: "click->controller#hi click->controller#goodbye" }
    assert_equal dummy.stimulus_actions("controller", click: %w[hi goodbye], blur: "onBlur"), { action: "click->controller#hi click->controller#goodbye blur->controller#onBlur" }
  end

  def test_class
    assert_equal dummy.stimulus_class("controller", "open", "open"), { "controller-open-class" => "open" }
    assert_equal dummy.stimulus_classes("controller", open: "open", closed: "closed", some_other: "foo"), { "controller-open-class" => "open", "controller-closed-class" => "closed", "controller-some-other-class" => "foo", }
  end

  def test_value
    assert_equal dummy.stimulus_value("controller", "open", true), { "controller-open-value" => "true" }
    assert_equal dummy.stimulus_value("controller", "names", %w[foo bar]), { "controller-names-value" => "[\"foo\",\"bar\"]" }
    assert_equal dummy.stimulus_value("controller", "user", { name: "foo" }), { "controller-user-value" => "{\"name\":\"foo\"}" }
    assert_equal dummy.stimulus_values("controller", open: true, closed: false, names: %w[foo bar], user: { name: "foo" }), { "controller-open-value" => "true", "controller-closed-value" => "false", "controller-names-value" => "[\"foo\",\"bar\"]",  "controller-user-value" => "{\"name\":\"foo\"}" }
  end

  def test_target
    assert_equal dummy.stimulus_target("controller", :input), { "controller-target" => "input" }
  end

  def test_param
    assert_equal dummy.stimulus_param("controller", "id", "123"), { "controller-id-param" => "123" }
    assert_equal dummy.stimulus_params("controller", id: "123", name: "foo"), { "controller-id-param" => "123", "controller-name-param" => "foo" }
  end

  def test_outlet
    assert_equal dummy.stimulus_outlet("controller", "result", ".result"), { "controller-result-outlet" => ".result" }
    assert_equal dummy.stimulus_outlets("controller", { result: ".result", output: ".output" }), { "controller-result-outlet" => ".result", "controller-output-outlet" => ".output" }
  end

  private

  def dummy
    StimulusHelped.new
  end
end
