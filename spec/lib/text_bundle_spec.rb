RSpec.describe Trundle::TextBundle do
  let(:content) { File.read(text_bundle_path + '/text.markdown') }
  let(:text_bundle) { described_class.new(text_bundle_path) }
  let(:text_bundle_path) { 'spec/samples/offical-example.textbundle' }

  context 'Reading a TextBundle' do
    it 'exists' do
      expect(text_bundle).to exist
    end

    it 'reads the text content' do
      expect(text_bundle.text).to eq(content)
    end
  end

  context 'Writing a TextBundle' do
    let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

    it 'does not exist' do
      expect(text_bundle).not_to exist
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

      it 'creates the text content file' do
        expect(File.exist?(text_bundle_path + '/text.markdown')).to be true
      end
    end
  end

  describe 'Class Methods' do
    describe '.open' do
      it 'returns an instance' do
        expect(described_class.open(text_bundle_path)).to be_a(described_class)
      end
    end
  end
end
