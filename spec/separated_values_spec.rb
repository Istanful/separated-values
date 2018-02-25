RSpec.describe SeparatedValues do
  it "has a version number" do
    expect(SeparatedValues::VERSION).not_to be nil
  end

  it 'has default options' do
    expect(SeparatedValues::DEFAULT_OPTIONS).to eq({
      separator: ';'
    })
  end
end
