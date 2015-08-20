RSpec.describe Trundle::TextBundle do
  describe 'Assets' do
    let(:file) { Pathname.new(file_path) }
    let(:file_path) { text_bundle_path + '/assets/' + file_name }
    let(:text_bundle) { described_class.new(text_bundle_path) }

    describe 'Reading' do
      let(:text_bundle_path) { 'spec/samples/assets.textbundle' }

      it 'has three assets' do
        expect(text_bundle.assets.length).to eq(3)
      end

      context 'file in the assets folder' do
        let(:file_name) { 'colours.txt' }

        it 'can be accessed' do
          expect(text_bundle.assets[file_name]).to eq(file)
        end
      end

      context 'file in a sub folder' do
        let(:file_name) { 'images/red.jpg' }

        it 'can be accessed' do
          expect(text_bundle.assets[file_name]).to eq(file)
        end
      end
    end
  end
end
