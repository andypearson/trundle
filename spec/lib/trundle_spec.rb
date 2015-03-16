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
end
