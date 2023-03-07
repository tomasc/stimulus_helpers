# frozen_string_literal: true

require_relative "lib/stimulus_helpers/version"

Gem::Specification.new do |spec|
  spec.name = "stimulus_helpers"
  spec.version = StimulusHelpers::VERSION
  spec.authors = ["Tomas Celizna", "Asger Behncke Jacobsen"]
  spec.email = ["tomas.celizna@gmail.com", "a@asgerbehnckejacobsen.dk"]

  spec.summary = "Helper methods for stimulus controllers."
  spec.description = "Helper methods for stimulus controllers."
  spec.homepage = "https://github.com/tomasc/stimulus_helpers"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/tomasc/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
end
