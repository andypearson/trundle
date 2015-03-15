class Trundle::TextStore
  attr_writer :content

  def initialize(path)
    @path = path
  end

  def content
    @content ||= File.read(@path)
  rescue
    @content = ''
  end

  def write
    File.open(@path, 'w') do |file|
      file.write(content)
    end
  end
end
