require 'separated_values/row'

module SeparatedValues
  class RowParser
    attr_reader :source_data, :options

    def initialize(source_data, options = DEFAULT_OPTIONS)
      @source_data = source_data
      @options = options
    end

    def parse
      Row.new(source_data_to_array)
    end

    private

    def source_data_to_array
      source_data.split(options[:separator])
    end
  end
end
