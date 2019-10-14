# BundledGems

[![Actions Status](https://github.com/toshimaru/bundled_gems/workflows/Ruby%20Test/badge.svg)](https://github.com/toshimaru/bundled_gems/actions)

Install gem specified in `Gemfile.lock` without `bundle install`.

## Installation

```console
$ gem install bundled_gems
```

Then, you can use `bgem` command.

## Usage

```console
$ bgem                    
Commands:
  bgem help [COMMAND]         # Describe available commands or one specific command
  bgem install [BUNDLED_GEM]  # install [BUNDLED_GEM] from `Gemfile.lock`
  bgem list                   # bundle list without `bundle install`
  bgem version                # bundled_gems version
```

### List gems

```console
$ bgem list
Gems included in `Gemfile.lock`:
  * actionpack, 5.2.3
  * actionview, 5.2.3
  * activesupport, 5.2.3
  ...(snip)...
```

### Install gem

```console
$ bgem install gem_name
```

## Example

```console
$ gem install bundled_gems  # Install bundled_gems and `bgem` command is available
$ bgem install rubocop      # install rubocop specified in `Gemfile.lock`
$ rubocop                   # Run rubocop
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/bundled_gems/issues. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BundledGem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/toshimaru/bundled_gems/blob/master/CODE_OF_CONDUCT.md).
