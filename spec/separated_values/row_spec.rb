require 'spec_helper'
require 'separated_values/row'

module SeparatedValues
  RSpec.describe Row do
    it 'responds to schema keys' do
      row = Row.new(%w[milk], schema: %i[spawn_of_satan])

      expect(row.spawn_of_satan).to eq 'milk'
    end

    describe '#respond_to?' do
      it 'returns true if schema contains key' do
        row = Row.new(%w[milk], schema: %i[spawn_of_satan])

        expect(row).to respond_to :spawn_of_satan
      end

      it 'returns false if no schema' do
        row = Row.new(%w[milk])

        expect(row).to_not respond_to :spawn_of_satan
      end

      it 'returns false if schema does not contains key' do
        row = Row.new(%w[milk], schema: %i[beverage])

        expect(row).to_not respond_to :spawn_of_satan
      end
    end

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
