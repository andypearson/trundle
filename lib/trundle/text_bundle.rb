class Trundle::TextBundle
  extend Trundle::InfoAccessors

  info_accessors(
    :version,
    :source_url,
    :creator_url,
    :creator_identifier
  )

  def initialize(path)
    @path = path
    @info_store = Trundle::InfoStore.new(File.join(@path, 'info.json'))
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

  def close
    Dir.mkdir(@path) unless exist?
    @info_store.write
    @text_store.write
  end

  def transient=(value)
    !!value
  end

  def transient?
    !!info['transient']
  end

  private
  def info
    @info_store.content
  end
end
