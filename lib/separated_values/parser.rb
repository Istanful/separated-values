require 'separated_values/document'
require 'separated_values/row_parser'

module SeparatedValues
  class Parser
    attr_reader :file_path, :options

    def initialize(file_path, options = {})
      @file_path = file_path
      @options = options
    end

    def parse
      Document.new(rows, options)
    end

    private

    def rows
      File.readlines(file_path).map do |line|
        RowParser.new(line, options).parse
      end
    end
  end
end
