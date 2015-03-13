RSpec.describe Trundle::TextBundle do
  let(:text_bundle) { described_class.new(text_bundle_path) }
  let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

  context 'Reading a TextBundle' do
    let(:content) { File.read(text_bundle_path + '/text.markdown') }
    let(:text_bundle_path) { 'spec/samples/offical-v2.textbundle' }

    it 'exists' do
      expect(text_bundle).to exist
    end

    it 'reads the text content' do
      expect(text_bundle.text).to eq(content)
    end
  end

  context 'Writing a TextBundle' do
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

    context 'using a block' do
      let(:text_bundle) do
        described_class.new(text_bundle_path) {}
      end

      it 'exists' do
        expect(text_bundle).to exist
      end
    end
  end

  describe 'Modifying a TextBundle' do
    let!(:text_bundle) do
      described_class.new(text_bundle_path) do |tb|
        tb.text = 'Text content'
      end
    end

    context 'to change the text' do
      let(:text) { 'Changed content!' }

      it 'is written' do
        text_bundle.text = text
        text_bundle.close

        expect(described_class.open(text_bundle_path).text).to eq(text)
      end

      context 'using a block' do
        before do
          described_class.new(text_bundle_path) do |tb|
            tb.text = text
          end
        end

        it 'is written' do
          expect(described_class.open(text_bundle_path).text).to eq(text)
        end
      end
    end
  end

  describe 'Class Methods' do
    describe '.open' do
      it 'returns an instance' do
        expect(described_class.open(text_bundle_path)).to be_a(described_class)
      end

      context 'using a block' do
        let(:text_bundle) { described_class.open(text_bundle_path) {} }

        it 'passes down to the new instance' do
          expect(text_bundle).to exist
        end
      end
    end
  end
end
