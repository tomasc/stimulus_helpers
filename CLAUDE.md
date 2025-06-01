# Instructions for Claude Code

## Project Overview

This is the `stimulus_helpers` Ruby gem - a utility library that provides helper methods for building Stimulus controller attributes in Ruby views. The gem makes it easier to work with Stimulus.js by providing a clean Ruby API for generating the necessary HTML attributes.

## Key Information

- **Gem Name**: stimulus_helpers
- **Current Version**: 0.1.0
- **Ruby Version**: 3.1.2
- **License**: MIT
- **Author**: Tomáš Celizna

## Project Structure

```
stimulus_helpers/
├── lib/
│   ├── stimulus_helpers.rb          # Main module with all helper methods
│   └── stimulus_helpers/
│       └── version.rb               # Version constant
├── test/
│   ├── stimulus_helpers_test.rb     # Test suite
│   └── test_helper.rb               # Test configuration
├── stimulus_helpers.gemspec         # Gem specification
├── Gemfile                          # Dependencies
├── Rakefile                         # Build tasks
└── README.md                        # Documentation
```

## Development Workflow

### Running Tests
```bash
bundle exec rake test
# or simply
bundle exec rake
```

### Running Linter
```bash
bundle exec rubocop
```

### Installing Dependencies
```bash
bundle install
```

### Building the Gem
```bash
bundle exec rake build
```

### Releasing a New Version
1. Update the version number in `lib/stimulus_helpers/version.rb`
2. Update CHANGELOG.md with the changes
3. Commit the changes
4. Run `bundle exec rake release`

## Code Style Guidelines

- Follow the RuboCop configuration in `.rubocop.yml`
- Use Ruby 3.1+ syntax features (like value omission in hash literals)
- Keep methods focused and well-documented
- Maintain test coverage for all public methods

## Helper Methods Overview

The gem provides the following helper methods:

1. **Controller**: `stimulus_controller(name)`
2. **Actions**: `stimulus_action(controller, action, listener)` and `stimulus_actions(controller, actions)`
3. **Classes**: `stimulus_class(controller, name, value)` and `stimulus_classes(controller, classes)`
4. **Values**: `stimulus_value(controller, name, value)` and `stimulus_values(controller, values)`
5. **Target**: `stimulus_target(controller, target)`
6. **Params**: `stimulus_param(controller, name, value)` and `stimulus_params(controller, params)`
7. **Outlets**: `stimulus_outlet(controller, name, value)` and `stimulus_outlets(controller, outlets)`

## Implementation Notes

- The main module uses `build_stimulus_action` and `build_stimulus_attribute` private methods to construct the attribute hashes
- Complex values (Arrays and Hashes) are automatically converted to JSON
- Attribute names are dasherized to follow Stimulus conventions
- The gem depends on ActiveSupport for string inflections

## Testing Approach

- Tests are in `test/stimulus_helpers_test.rb`
- Each helper method has corresponding test coverage
- Tests verify the exact structure of returned hashes
- Run tests with `bundle exec rake test`

## Common Tasks

### Adding a New Helper Method

1. Add the public method to `lib/stimulus_helpers.rb`
2. Use the existing private methods (`build_stimulus_action` or `build_stimulus_attribute`) if applicable
3. Add corresponding tests to `test/stimulus_helpers_test.rb`
4. Update the README.md with usage examples
5. Run tests and linter to ensure everything passes

### Debugging

- Use `bin/console` to start an IRB session with the gem loaded
- The test suite uses Minitest - add debugging with `puts` or use a debugger gem
- Check the GitHub Actions workflow results for CI failures

## Important Considerations

1. **Backwards Compatibility**: This gem is used by other projects, so maintain backwards compatibility when making changes
2. **Dependencies**: Keep dependencies minimal - currently only requires ActiveSupport
3. **Documentation**: Update README.md when adding new features
4. **Versioning**: Follow semantic versioning (MAJOR.MINOR.PATCH)

## Git Workflow

- The main branch is protected
- Create feature branches for new work
- Ensure all tests pass before merging
- The GitHub Actions workflow runs on every push

## Troubleshooting

- If tests fail locally but pass in CI, check Ruby version (should be 3.1.2)
- RuboCop violations can often be auto-fixed with `bundle exec rubocop -A`
- Bundle install issues: try `bundle update` or delete `Gemfile.lock` and reinstall

## Future Improvements

Based on the current codebase, potential areas for enhancement:
- Add more comprehensive documentation/examples
- Consider adding type signatures (RBS file is currently minimal)
- Add more edge case testing
- Consider performance optimizations for large attribute sets
