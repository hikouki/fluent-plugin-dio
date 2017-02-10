require 'helper'

class DioFilterTest < Test::Unit::TestCase
  def setup
    omit("Use Fluentd v0.12 or later.") unless defined?(Fluent::Filter)

    Fluent::Test.setup
  end

  CONFIG = %[
    key created_at
  ]

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::FilterTestDriver.new(Fluent::DioFilter, tag).configure(conf)
  end

  def test_configure
    d = create_driver(CONFIG)
    assert d.instance.config["key"]
  end

  def test_default_key
    d = create_driver("")

    d.run do
      d.filter({"a" => 1, "time" => "2011-01-02 13:14:15 UTC"})
    end
    expect = {"a" => 1, "time" => "1293974055"}
    assert_equal expect, d.filtered_as_array[0][2]
  end

  def test_key
    d = create_driver

    d.run do
      d.filter({"a" => 1, "created_at" => "2011-01-02 13:14:15 UTC"})
    end
    expect = {"a" => 1, "created_at" => "1293974055"}
    assert_equal expect, d.filtered_as_array[0][2]
  end
end
