require 'spec_helper'
require 'separated_values/parser'

module SeparatedValues
  RSpec.describe Parser do
    describe '#parse' do
      it 'returns a document' do
        allow(File).to receive(:readlines).and_return []
        result = Parser.new('my_file').parse

        expect(result).to be_an_instance_of(Document)
      end

      it 'passes parsed rows to the document' do
        file_path = 'my_file'
        lines = %w[one;two three;four]
        allow(File).to receive(:readlines).with(file_path).and_return lines
        result = Parser.new('my_file').parse

        expect(result.rows.length).to eq 2
      end
    end
  end
end
