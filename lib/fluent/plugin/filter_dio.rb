class Fluent::DioFilter < Fluent::Filter
  Fluent::Plugin.register_filter('dio', self)

  config_param :keys, :string, :default => 'time'

  def configure(conf)
    super

    @keys = @keys.split(',').map(&:strip)
  end

  def filter(tag, time, record)
    @keys.each do |key|
      record[key] = Time.parse(record[key]).to_i
    end
    record
  end
end if defined?(Fluent::Filter)
