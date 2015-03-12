RSpec.describe Trundle::TextBundle do
  let(:content) { File.read(text_bundle_path + '/text.markdown') }
  let(:text_bundle) { described_class.new(text_bundle_path) }
  let(:text_bundle_path) { 'spec/samples/offical-example.textbundle' }

  context 'Reading a TextBundle' do
    it 'reads the text content' do
      expect(text_bundle.text).to eq(content)
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
