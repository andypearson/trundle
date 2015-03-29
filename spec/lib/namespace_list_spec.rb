RSpec.describe Trundle::NamespaceList do
  let(:namespace_list) { described_class.new }

  it 'does not include a namespace when it is empty' do
    expect(namespace_list.include?(:monkey_island)).to be false
  end

  context 'a namespace has been set' do
    before do
      namespace_list.monkey_island('io.monkeyisland')
    end

    it 'includes the namespace' do
      expect(namespace_list.include?(:monkey_island)).to be true
    end

    it 'returns the key' do
      expect(namespace_list.key(:monkey_island)).to eq('io.monkeyisland')
    end
  end
end
