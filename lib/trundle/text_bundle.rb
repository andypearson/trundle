class Trundle::TextBundle
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

  # TODO: raise exception when transient is not being set to a boolean
  def transient=(value)
    !!value
  end

  # TODO: add a standard accessor for transient as well (for consistency)
  def transient?
    !!info['transient']
  end

  def version=(value)
    info['version'] = value
  end

  def version
    info['version']
  end

  def source_url=(value)
    info['sourceURL'] = value
  end

  def source_url
    info['sourceURL']
  end

  def creator_url=(value)
    info['creatorURL'] = value
  end

  def creator_url
    info['creatorURL']
  end

  def creator_identifier=(value)
    info['creatorIdentifier'] = value
  end

  def creator_identifier
    info['creatorIdentifier']
  end

  private
  def info
    @info_store.content
  end
end
