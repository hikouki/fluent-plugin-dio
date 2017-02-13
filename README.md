# Fluent::Plugin::Dio

[![Build Status](https://travis-ci.org/hikouki/fluent-plugin-dio.svg?branch=master)](https://travis-ci.org/hikouki/fluent-plugin-dio)

Output filter plugin of fluentd. Convert to timestamp from date string.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-dio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-dio

## Usage

### DioFilter

Add dio filter.

```xml
<filter test.**>
  @type dio
  keys created_at, updated_at
</filter>
```

Assuming following inputs are coming:

```javascript
{"a" => 1, "created_at" => "2011-01-02 13:14:15 UTC", "updated_at" => "2011-01-01 13:14:15 UTC"}
```

Then output becomes as belows:

```javascript
{"a" => 1, "created_at" => 1293974055, "updated_at" => 1293887655}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hikouki/fluent-plugin-dio.

