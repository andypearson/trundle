RSpec.describe Trundle::Key do
  describe '#camelize' do
    it 'does not change a lower case string' do
      expect(described_class.new('version').camelize).to eq('version')
    end

    it 'handles a multi word string' do
      expect(described_class.new('creator_identifier').camelize).to eq('creatorIdentifier')
    end

    it 'handles a string with URL at the end' do
      expect(described_class.new('source_url').camelize).to eq('sourceURL')
    end

    it 'handles a string with URL in the middle' do
      expect(described_class.new('source_url_original').camelize).to eq('sourceUrlOriginal')
    end
  end
end
