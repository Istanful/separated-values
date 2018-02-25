module SeparatedValues
  class Document
    attr_reader :rows, :options

    def initialize(rows, options = DEFAULT_OPTIONS)
      @rows = rows
      @options = options
    end

    def [](index)
      rows[index]
    end

    def to_hash_array
      rows.map do |row|
        row.to_h(options[:schema])
      end
    end
  end
end
