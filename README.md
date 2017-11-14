# LcdDigit

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/lcd_digit`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lcd_digit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lcd_digit

## Usage

    require 'lcd_digit'

    LcdDigit.render(number, size = 2) # size default: 2

Example:

```ruby
   LcdDigit.render(1234567890)

      --   --        --   --   --   --   --   --
   |    |    | |  | |    |       | |  | |  | |  |
   |    |    | |  | |    |       | |  | |  | |  |
      --   --   --   --   --        --   --
   | |       |    |    | |  |    | |  |    | |  |
   | |       |    |    | |  |    | |  |    | |  |
      --   --        --   --        --   --   --
 => "Cheers :)"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nguyentamphu/lcd_digit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LcdDigit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lcd_digit/blob/master/CODE_OF_CONDUCT.md).


## Follow me on [Github](https://github.com/nguyentamphu)
