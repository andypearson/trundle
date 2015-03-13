require 'json'

class Trundle::TextBundle
  attr_reader :path
  attr_writer :text

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
      yield(self)
      close
    end
  end

  def exist?
    File.exist?(path)
  end

  def text
    @text ||= File.read(text_path)
  end

  def info
    @info ||= JSON.parse(File.read(info_path))
  end

  def close
    Dir.mkdir(path) unless exist?
    write_text
  end

  def transient?
    !!info['transient']
  end

  def version
    info['version']
  end

  def source_url
    info['sourceURL']
  end

  def creator_url
    info['creatorURL']
  end

  def creator_identifier
    info['creatorIdentifier']
  end

  private
  def text_path
    @text_path ||= File.join(path, 'text.markdown')
  end

  def info_path
    @info_path ||= File.join(path, 'info.json')
  end

  def write_text
    File.open(text_path, 'w') do |file|
      file.write(text)
    end
  end
end
