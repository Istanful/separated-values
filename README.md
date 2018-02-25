# SeparatedValues

This is a gem for easily parsing primitive data sheet files.
It supports file types like CSV and TSV to name a few.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'separated_values'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install separated_values

## Usage

Parsing a file:
```ruby
document = SeparatedValues.parse('my_file.csv')
```

As you might guess the `document` file contains the contents
of the file. You can access the cell values as a two dimensional array.
```ruby
document[0][0] = 'foo'
```

The parser will default to parse CSV files.
If you want to parse a custom format you can use the `:separator` option.
```ruby
document = SeparatedValues.parse('my_file.tsv', separator: '\t')
```

The parser also comes with the handy `:schema` option.
By providing this option you can convert the document to an array of hashes:
```ruby
document = SeparatedValues.parse('my_file.csv', schema: [:first_name, :last_name])
document.to_hash_array
#=>
# [
#     { first_name: 'Luke', last_name: 'Skywalker' },
#     { first_name: 'Han', last_name: 'Solo' }
# ]
```

The keys defined in the schema will also be available as methods:
```ruby
document = SeparatedValues.parse('my_file.csv', schema: [:first_name, :last_name])
document[0].first_name = 'Luke'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/istanful/separated_values.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
