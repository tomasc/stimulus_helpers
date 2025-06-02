# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2025-01-06

### Performance
- Optimize string operations and concatenations for large attribute sets
- Add caching for dasherized keys to avoid repeated string transformations
- Implement batch JSON serialization to reduce overhead
- Improve action building performance by replacing array operations with direct string building

## [0.1.0] - 2024-XX-XX

### Added
- Initial release of stimulus_helpers gem
- Helper methods for Stimulus controller attributes:
  - `stimulus_controller(name)` - Controller binding
  - `stimulus_action(controller, action, listener)` and `stimulus_actions(controller, actions)` - Action bindings
  - `stimulus_class(controller, name, value)` and `stimulus_classes(controller, classes)` - CSS class bindings
  - `stimulus_value(controller, name, value)` and `stimulus_values(controller, values)` - Value bindings
  - `stimulus_target(controller, target)` - Target bindings
  - `stimulus_param(controller, name, value)` and `stimulus_params(controller, params)` - Parameter bindings
  - `stimulus_outlet(controller, name, value)` and `stimulus_outlets(controller, outlets)` - Outlet bindings
- Automatic JSON serialization for complex values (Arrays and Hashes)
- Automatic dasherization of attribute names following Stimulus conventions