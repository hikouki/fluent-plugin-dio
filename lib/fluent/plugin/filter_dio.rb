class Fluent::DioFilter < Fluent::Filter
  Fluent::Plugin.register_filter('date', self)

  config_param :key, :string, :default => 'time'

  def filter(tag, time, record)
    record[@key] = Time.parse(record[@key]).strftime('%s')
    record
  end
end if defined?(Fluent::Filter)
