RSpec.describe Trundle::TextBundle do
  describe 'Namespaces' do
    let(:text_bundle) { described_class.new(text_bundle_path) }

    before do
      Trundle.configure do |config|
        config.namespaces do
          monkey_island 'io.monkeyisland'
          scabb_island 'io.scabbisland'
        end
      end
    end

    describe 'Namespaces' do
      describe 'Reading' do
        let(:text_bundle_path) { 'spec/samples/namespaces.textbundle' }

        it 'reads attributes from the namespaces' do
          expect(text_bundle.monkey_island.version).to eq(1)
          expect(text_bundle.scabb_island.version).to eq(6)
        end
      end
    end
  end

end
