RSpec.describe Trundle::Config do
  let(:config) { described_class.new }

  it 'has a default version' do
    expect(config.version).to eq(2)
  end

  it 'is not transient by default' do
    expect(config.transient).to be false
  end

  describe 'version' do
    let(:version) { 1 }

    before do
      config.version = version
    end

    it 'is set' do
      expect(config.version).to eq(version)
    end
  end

  describe 'type' do
    let(:type) { 'net.daringfireball.markdown' }

    before do
      config.type = type
    end

    it 'is set' do
      expect(config.type).to eq(type)
    end
  end

  describe 'transient' do
    let(:transient) { true }

    before do
      config.transient = transient
    end

    it 'is set' do
      expect(config.transient).to eq(transient)
    end

    it 'raises an error when the value is not a boolean' do
      [[], '', nil, {}].each do |value|
        expect{ config.transient = value }.to raise_error(ArgumentError, 'transient must be a boolean')
      end
    end
  end

  describe 'creator_url' do
    let(:creator_url) { 'file:///Applications/MyApp' }

    before do
      config.creator_url = creator_url
    end

    it 'is set' do
      expect(config.creator_url).to eq(creator_url)
    end
  end

  describe 'creator_identifier' do
    let(:creator_identifier) { 'com.example.myapp' }

    before do
      config.creator_identifier = creator_identifier
    end

    it 'is set' do
      expect(config.creator_identifier).to eq(creator_identifier)
    end
  end

  describe 'source_url' do
    let(:source_url) { 'file:///Users/johndoe/Documents/mytext.markdown' }

    before do
      config.source_url = source_url
    end

    it 'is set' do
      expect(config.source_url).to eq(source_url)
    end
  end
end
