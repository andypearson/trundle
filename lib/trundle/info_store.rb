require 'json'

class Trundle::InfoStore
  def initialize(path)
    @path = path
  end

  def content
    @content ||= JSON.parse(File.read(@path))
  rescue
    @content = {}
  end

  def write
    File.open(@path, 'w') do |file|
      file.write(JSON.pretty_generate(content))
    end
  end
end
