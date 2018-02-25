module SeparatedValues
  class Row
    attr_reader :options

    def initialize(values, options = {})
      @values = values
      @options = options
    end

    def [](index)
      @values[index]
    end

    def to_h(schema = options[:schema])
      schema.each_with_object({}).with_index do |(key, hash), i|
        hash[key] = @values[i]
      end
    end
  end
end
