RSpec.describe Trundle::TextBundle do
  let(:text_bundle) { described_class.new(text_bundle_path) }
  let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

  context 'Reading a TextBundle' do
    let(:content) { File.read(text_bundle_path + '/text.markdown') }
    let(:text_bundle_path) { 'spec/samples/offical-v2.textbundle' }

    it 'exists' do
      expect(text_bundle).to exist
    end

    it 'is transient' do
      expect(text_bundle).to be_transient
    end

    it 'reads the text content' do
      expect(text_bundle.text).to eq(content)
    end

    it 'reads the version' do
      expect(text_bundle.version).to eq(2)
    end

    it 'reads the creator URL' do
      expect(text_bundle.creator_url).to eq('file:///Applications/Example.app/')
    end

    it 'reads the creator identifier' do
      expect(text_bundle.creator_identifier).to eq('com.example.editor')
    end

    it 'reads the source URL' do
      expect(text_bundle.source_url).to eq('file:///Users/johndoe/Documents/myfile.markdown/')
    end
  end

  context 'Writing a TextBundle' do
    it 'does not exist' do
      expect(text_bundle).not_to exist
    end

    it 'has no text' do
      expect(text_bundle.text).to eq('')
    end

    it 'has no info' do
      expect(text_bundle.info).to eq({})
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

        expect(described_class.new(text_bundle_path).text).to eq(text)
      end

      context 'using a block' do
        before do
          described_class.new(text_bundle_path) do |tb|
            tb.text = text
          end
        end

        it 'is written' do
          expect(described_class.new(text_bundle_path).text).to eq(text)
        end
      end
    end
  end
end
