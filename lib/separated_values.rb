require 'separated_values/version'
require 'separated_values/parser'

module SeparatedValues
  DEFAULT_OPTIONS = { separator: ';' }

  def self.parse(file_path, options = DEFAULT_OPTIONS)
    Parser.new(file_path, options).parse
  end
end
