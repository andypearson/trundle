# trundle

A gem for reading and writing [TextBundle](http://textbundle.org/) files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trundle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trundle

## Usage

### Configure Default Settings

```ruby
Trundle.configure do
  config.creator_url = 'http://example.com'
  config.creator_identifier = 'com.example.myapp'
end
```

### Read a TextBundle

```ruby
example = Trundle.open('example.textbundle')
puts example.text
puts example.info
puts example.assets
```

### Write a TextBundle

```ruby
example = Trundle.open('example.textbundle')
example.text = 'Some text'
example.custom_label = 'Label'
example.assets << File.open('image.jpg')
example.close

# or

Trundle.open('example.textbundle') do |f|
  f.text = 'Some text'
  f.custom_label = 'Label'
  f.assets << File.open('image.jpg')
end
```

## Contributing

1. Fork it ( https://github.com/andypearson/trundle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
