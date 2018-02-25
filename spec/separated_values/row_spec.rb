require 'spec_helper'
require 'separated_values/row'

module SeparatedValues
  RSpec.describe Row do
    describe '[]' do
      it 'returns the value at the given position' do
        row = Row.new(%w[one two])

        expect(row[0]).to eq 'one'
        expect(row[1]).to eq 'two'
      end
    end

    describe 'to_h' do
      it 'returns the values with the given schema' do
        row = Row.new(%w[milk lemonade], schema: %i[spawn_of_satan beverage])
        expected_hash = { spawn_of_satan: 'milk', beverage: 'lemonade' }

        expect(row.to_h).to eq expected_hash
      end
    end
  end
end
