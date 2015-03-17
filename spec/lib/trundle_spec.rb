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

  describe '.configure' do
    it 'sets the version' do
      Trundle.configure do |config|
        config.version = 2
      end
      expect(Trundle.config.version).to eq(2)
    end

    it 'sets the creator URL' do
      Trundle.configure do |config|
        config.creator_url = 'http://example.com'
      end
      expect(Trundle.config.creator_url).to eq('http://example.com')
    end

    it 'TODO: fresh config for every spec' do
      expect(Trundle.config.version).not_to eq(2)
    end
  end
end
