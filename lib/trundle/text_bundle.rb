class Trundle::TextBundle
  attr_reader :path

  def self.open(path)
    if block_given?
      self.new(path, &Proc.new)
    else
      self.new(path)
    end
  end

  def initialize(path)
    @path = path
    if block_given?
      yield
      close
    end
  end

  def exist?
    File.exist?(path)
  end

  def text
    @text ||= File.read(text_path)
  end

  def close
    Dir.mkdir(path) unless exist?
    write_text
  end

  private
  def text_path
    @text_path ||= File.join(path, 'text.markdown')
  end

  def write_text
    File.open(text_path, 'w') do |file|
      file.write(text)
    end
  end
end
