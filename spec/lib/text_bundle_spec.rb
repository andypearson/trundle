RSpec.describe Trundle::TextBundle do
  let(:text_bundle) { described_class.new(text_bundle_path) }

  describe 'Reading a TextBundle' do
    let(:text_bundle_path) { 'spec/samples/offical-v2.textbundle' }

    it 'exists' do
      expect(text_bundle).to exist
    end

    context 'when configuration options are set' do
      let(:text_bundle_path) { 'spec/samples/blank.textbundle' }

      before do
        Trundle.configure do |config|
          config.version = 3
        end
      end

      it 'does not merge in the config' do
        expect(text_bundle.version).not_to eq(3)
      end
    end
  end

  describe 'Writing a TextBundle' do
    let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

    it 'does not exist' do
      expect(text_bundle).not_to exist
    end

    it 'has no text' do
      expect(text_bundle.text).to eq('')
    end

    context 'when closed' do
      before do
        text_bundle.close
      end

      it 'exists' do
        expect(text_bundle).to exist
      end

      it 'creates the containing folder' do
        expect(File.exist?(text_bundle_path)).to be true
      end

      it 'creates the text file' do
        expect(File.exist?(text_bundle_path + '/text.markdown')).to be true
      end

      it 'creates the info file' do
        expect(File.exist?(text_bundle_path + '/info.json')).to be true
      end
    end

    context 'using a block' do
      let(:text_bundle) do
        described_class.new(text_bundle_path) {}
      end

      it 'exists' do
        expect(text_bundle).to exist
      end
    end

    context 'when configuration options are set' do
      before do
        Trundle.configure do |config|
          config.version = 3
        end
      end

      it 'merges in the config' do
        expect(text_bundle.version).to eq(3)
      end
    end
  end
end
