module SeparatedValues
  class Row
    attr_reader :options

    def initialize(values, options = DEFAULT_OPTIONS)
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

    def method_missing(name, *args, &block)
      return to_h[name] if respond_to_missing?(name, *args)
      super
    end

    def respond_to_missing?(name, *args)
      !!options[:schema] && options[:schema].include?(name)
    end
  end
end
