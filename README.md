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

### Reading an existing TextBundle

Imagine you've got a TextBundle file saved at `~/example-bundle.textbundle`

You can open that very easily with just:

```ruby
example = Trundle.open('~/example-bundle.textbundle')
```

That'll give you an instance of a `Trundle::TextBundle` and you'll be able to read out the text content of the bundle using:

```ruby
example.text
```

You can also access all of the core attributes outlined in the specification:

```ruby
example.creator_identifier
example.creator_url
example.source_url
example.type
example.version
```

As well as finding out if this TextBundle is transient or not:

```ruby
example.transient?
```

### Writing a TextBundle

Now imagine you'd like to create a new TextBundle, you can do that by opening a file where one does not already exist (just as you usually do in Ruby)

```ruby
my_example = Trundle.open('~/my-example-bundle.textbundle')
```

Setting the text content of this bundle is as easy as:

```ruby
my_example.text = 'This is my bundle!'
```

And you can set the values in a similar way:

```ruby
example.creator_identifier = 'com.my-app'
example.creator_url = 'http://my-app.com'
example.source_url = 'http://my-app.com'
example.type = 'net.daringfireball.markdown'
example.version = 2
example.transient = false
```

Once you're happy with the state of your new TextBundle you can save it to the filesystem by calling:

```ruby
example.close
```

Passing a block to `Trundle.open` will set values and write the bundle in one fell swoop:

```ruby
Trundle.open('~/my-example-bundle.textbundle') do |tb|
  tb.text = 'This is my bundle!'
  tb.source_url = 'http://my-app.com'
end
```


### Setting up default values

Setting up your new TextBundles over and over again can get pretty boring. Instead, you can set up defaults that'll apply to any TextBundle that you create:

```ruby
Trundle.configure do |config|
  config.creator_identifier = 'com.my-app'
  config.creator_url = 'http://my-app.com'
  config.source_url = 'http://my-app.com'
  config.type = 'net.daringfireball.markdown'
  config.version = 2
  config.transient = false
end
```

Out of the box, trundle is setup with the following defaults:

```ruby
Trundle.configure do |config|
  config.version = 2
  config.transient = false
end
```


### Working with namespaces

Applications can add custom meta data to any TextBundle by including it under a unique application key. In Trundle, this is called a namespace.

You need to tell trundle about the namespaces that you'd like to work with. You can do that in the config:

```ruby
Trundle.configure do |config|
  config.namespaces do
    my_app 'com.my-app'
  end
end
```

The bit on the left defines the name of the accessor method and the bit on the right is the application key that'll be read and written. You can setup as many namespaces as you need.

Once trundle knows about your namespaces, you can read custom values from them:

```ruby
existing_document = Trundle.open('~/document.textbundle')
existing_document.my_app.version
existing_document.my_app.document_type
```

And also write custom values too:

```ruby
my_document = Trundle.open('~/my-document.textbundle')
my_document.my_app.version = 42
my_document.my_app.document_type = 'Article'
my_document.close
```


## Next things

- TODO: rubocop the code
- TODO: add support for assets
- TODO: could the configuration DSL be more succinct?
- TODO: default values for namespaces?

## Contributing

1. Fork it ( https://github.com/andypearson/trundle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
