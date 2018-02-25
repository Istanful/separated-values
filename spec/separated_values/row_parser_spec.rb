require 'spec_helper'
require 'separated_values/row_parser'

module SeparatedValues
  RSpec.describe RowParser do
    describe '#parse' do
      it 'returns a row' do
        result = RowParser.new('one;two').parse

        expect(result).to be_an_instance_of Row
      end

      it 'provides the row with the values' do
        result = RowParser.new('one;two').parse

        expect(result[0]).to eq 'one'
        expect(result[1]).to eq 'two'
      end

      it 'parses with the given separator' do
        result = RowParser.new('one two', separator: ' ').parse

        expect(result[0]).to eq 'one'
        expect(result[1]).to eq 'two'
      end
    end
  end
end
