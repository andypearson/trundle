RSpec.describe Trundle::TextBundle do
  describe 'Text' do
    let(:text_bundle) { described_class.new(text_bundle_path) }

    describe 'Reading' do
      let(:content) { File.read(text_bundle_path + '/text.markdown') }
      let(:text_bundle_path) { 'spec/samples/offical-v2.textbundle' }

      it 'reads the text content' do
        expect(text_bundle.text).to eq(content)
      end
    end

    describe 'Writing' do
      let(:text) { 'Guybrush Threepwood is a mighty pirate. Ish.' }
      let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

      it 'writes the text content' do
        text_bundle.text = text
        text_bundle.close

        expect(described_class.new(text_bundle_path).text).to eq(text)
      end
    end
  end
end
