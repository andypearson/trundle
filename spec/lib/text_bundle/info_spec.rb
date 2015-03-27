RSpec.describe Trundle::TextBundle do
  describe 'Info' do
    let(:text_bundle) { described_class.new(text_bundle_path) }

    describe 'Reading' do
      let(:text_bundle_path) { 'spec/samples/offical-v2.textbundle' }

      it 'is transient' do
        expect(text_bundle).to be_transient
      end

      it 'reads the type' do
        expect(text_bundle.type).to eq('net.daringfireball.markdown')
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

    describe 'Writing' do
      let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

      it 'writes the transient setting' do
        text_bundle.transient = false
        text_bundle.close

        expect(described_class.new(text_bundle_path)).not_to be_transient
      end

      it 'writes the version' do
        text_bundle.version = 2
        text_bundle.close

        expect(described_class.new(text_bundle_path).version).to eq(2)
      end

      it 'writes the creator URL' do
        text_bundle.creator_url = 'file:///Applications/Example.app/'
        text_bundle.close

        expect(described_class.new(text_bundle_path).creator_url).to eq('file:///Applications/Example.app/')
      end

      it 'writes the creator identifier' do
        text_bundle.creator_identifier = 'com.example.editor'
        text_bundle.close

        expect(described_class.new(text_bundle_path).creator_identifier).to eq('com.example.editor')
      end

      it 'writes the source URL' do
        text_bundle.source_url = 'file:///Users/johndoe/Documents/myfile.markdown/'
        text_bundle.close

        expect(described_class.new(text_bundle_path).source_url).to eq('file:///Users/johndoe/Documents/myfile.markdown/')
      end

      it 'writes the type' do
        text_bundle.type = 'net.daringfireball.markdown'
        text_bundle.close

        expect(described_class.new(text_bundle_path).type).to eq('net.daringfireball.markdown')
      end

      describe '#transient=' do
        it 'raises an error when the value is not a boolean' do
          [[], '', nil, {}].each do |value|
            expect{ text_bundle.transient = value }.to raise_error(ArgumentError, 'transient must be a boolean')
          end
        end
      end
    end
  end
end
