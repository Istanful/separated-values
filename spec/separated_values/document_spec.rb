require 'spec_helper'
require 'separated_values/row'
require 'separated_values/document'

module SeparatedValues
  RSpec.describe Document do
    describe '[]' do
      it 'returns the row at the given index' do
        rows = [
          Row.new(%w[one two]),
          Row.new(%w[three four])
        ]
        document = Document.new(rows)

        expect(document[0]).to eq rows[0]
        expect(document[1]).to eq rows[1]
      end
    end

    describe 'to hash array' do
      it 'returns an array of hashes with the given schema' do
        schema = %i[first_name last_name]
        rows = [ Row.new(%w[Luke Skywalker]) ]
        document = Document.new(rows, schema: schema)

        expect(document.to_hash_array).to eq([
          { first_name: 'Luke', last_name: 'Skywalker' }
        ])
      end
    end
  end
end
