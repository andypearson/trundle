require 'json'

class Trundle::TextBundle
  def self.open(path)
    if block_given?
      self.new(path, &Proc.new)
    else
      self.new(path)
    end
  end

  def initialize(path)
    @path = path
    @text_store = Trundle::TextStore.new(File.join(@path, 'text.markdown'))

    if block_given?
      yield(self)
      close
    end
  end

  def exist?
    File.exist?(@path)
  end

  def text
    @text_store.content
  end

  def text=(value)
    @text_store.content = value
  end

  def info
    @info ||= JSON.parse(File.read(info_path))
  end

  def close
    Dir.mkdir(@path) unless exist?
    @text_store.write
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
  def info_path
    @info_path ||= File.join(@path, 'info.json')
  end
end
