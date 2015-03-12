class Trundle::TextBundle
  attr_reader :path

  def self.open(path)
    self.new(path)
  end

  def initialize(path)
    @path = path
  end

  def text
    @text ||= File.read(File.join(path, 'text.markdown'))
  end
end
