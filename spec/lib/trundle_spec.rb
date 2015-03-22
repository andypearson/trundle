RSpec.describe Trundle do
  let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

  describe '.open' do
    it 'returns an instance' do
      expect(described_class.open(text_bundle_path)).to be_a(Trundle::TextBundle)
    end

    context 'using a block' do
      let(:text_bundle) { described_class.open(text_bundle_path) {} }

      it 'passes down to the new instance' do
        expect(text_bundle).to exist
      end
    end
  end

  describe '.config' do
    it 'returns a config object' do
      expect(Trundle.config).to be_a(Trundle::Config)
    end

    it 'always returns the same config object' do
      expect(Trundle.config).to equal(Trundle.config)
    end
  end

  describe '.configure' do
    before do
      Trundle.configure do |config|
        config.version = 1
        config.creator_url = 'http://example.com'
      end
    end

    it 'writes config values' do
      expect(Trundle.config.version).to eq(1)
      expect(Trundle.config.creator_url).to eq('http://example.com')
    end
  end
end
