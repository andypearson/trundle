RSpec.describe Trundle::Key do
  describe '#camelize' do
    it 'does not change a lower case string' do
      expect(described_class.new('version').camelize).to eq('version')
    end

    it 'does not change a camelized string' do
      expect(described_class.new('creatorIdentifier').camelize).to eq('creatorIdentifier')
    end

    it 'does not change a camelized string with URL at the end' do
      expect(described_class.new('sourceURL').camelize).to eq('sourceURL')
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

  describe '#underscore' do
    it 'does not change a lower case string' do
      expect(described_class.new('version').underscore).to eq('version')
    end

    it 'does not change an underscored string' do
      expect(described_class.new('creator_identifier').underscore).to eq('creator_identifier')
    end

    it 'does not change an underscored string with URL at the end' do
      expect(described_class.new('source_url').underscore).to eq('source_url')
    end

    it 'handles a multi word string' do
      expect(described_class.new('creatorIdentifier').underscore).to eq('creator_identifier')
    end

    it 'handles a string with URL at the end' do
      expect(described_class.new('sourceURL').underscore).to eq('source_url')
    end

    it 'handles a string with URL in the middle' do
      expect(described_class.new('sourceUrlOriginal').underscore).to eq('source_url_original')
    end
  end
end
