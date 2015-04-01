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

    describe 'Reading' do
      let(:text_bundle_path) { 'spec/samples/namespaces.textbundle' }

      it 'always returns the same namespace object' do
        expect(text_bundle.monkey_island).to equal(text_bundle.monkey_island)
        expect(text_bundle.scabb_island).not_to equal(text_bundle.monkey_island)
      end

      it 'reads attributes from the namespaces' do
        expect(text_bundle.monkey_island.version).to eq(1)
        expect(text_bundle.scabb_island.version).to eq(6)
      end

      it 'reads underscored attributes' do
        expect(text_bundle.monkey_island.local_castaway).to eq('Herman Toothrot')
      end
    end

    describe 'Writing' do
      let(:text_bundle_path) { 'spec/tmp/example.textbundle' }

      it 'writes a value' do
        text_bundle.monkey_island.version = 9
        text_bundle.close

        fresh_bundle = described_class.new(text_bundle_path)
        expect(fresh_bundle.monkey_island.version).to eq(9)
      end

      it 'writes a value to an underscored attribute' do
        text_bundle.monkey_island.local_castaway = 'Herman Toothrot'
        text_bundle.close

        fresh_bundle = described_class.new(text_bundle_path)
        expect(fresh_bundle.monkey_island.local_castaway).to eq('Herman Toothrot')
      end
    end
  end
end
