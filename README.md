# some

Inspired by `Option.map` in Scala.

`unless var.nil?`, but as a block. Might save a few lines ;)

```crystal
/\d+/.match("n1.txt").fmap do |match_data|  # => (MatchData | Nil)
  match_data[0].fmap do |level_str|         # => (String | Nil)
    level_str.to_i32                        # => "1"
  end
end
```

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     some:
       github: tkshnwesper/some
   ```

2. Run `shards install`

## Usage

```crystal
require "some"

possibly_nil : String | Nil

possibly_nil = "Hello"

Some.new(possibly_nil).fmap do |definitely_not_nil|
  puts "#{definitely_not_nil}! Greetings, young 'un!" # gets executed as expected!
end

possibly_nil = nil

Some.new(possibly_nil).fmap do
  `rm -rf /` # this won't get executed
end
```

### Object extension

You may also use the lib by enabling object extensions.
```crystal
some_object_extension(:some_map) # takes an optional parameter which sets method name (default: fmap)

result = 10.some_map do |value|
  value.to_s
end

puts result # => 10
```

Using `Some.new` would fail the compilation whenever the parameter passed cannot be `nil`. For example, `Some.new("hello")` would give compilation error.

However, the object extension can be used even on those objects which do not have `Nil` in their union type. For example `"hello".fmap` would not result in a compilation error.

## Contributing

1. Fork it (<https://github.com/tkshnwesper/some/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [tkshnwesper](https://github.com/tkshnwesper) - creator and maintainer
