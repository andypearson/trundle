class Trundle::TextBundle
  extend Trundle::InfoAccessors

  info_accessors(
    :creator_identifier,
    :creator_url,
    :source_url,
    :transient,
    :type,
    :version
  )

  def initialize(path)
    @path = path
    @info_store = Trundle::InfoStore.new(File.join(@path, 'info.json'))
    @text_store = Trundle::TextStore.new(File.join(@path, 'text.markdown'))

    @info_store.content = Trundle.config.to_h unless exist?

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
    write_namespaces
    @info_store.write
    @text_store.write
  end

  def transient=(value)
    raise ArgumentError, 'transient must be a boolean' unless !!value == value
    info['transient'] = value
  end

  def transient?
    !!info['transient']
  end

  def method_missing(name, *args, &block)
    if Trundle.config.namespace?(name)
      namespaced_attributes_for(name)
    else
      raise Trundle::NamespaceNotDefined, namespace_not_defined_message(name)
    end
  end

  private
  def info
    @info_store.content
  end

  def namespaced_attributes_for(name)
    var = "@#{name}"
    if !instance_variable_defined?(var)
      attributes = info[Trundle.config.namespace_key(name)] || {}
      instance_variable_set(var, Trundle::NamespacedAttributes.new(attributes))
    end
    instance_variable_get(var)
  end

  def write_namespaces
    Trundle.config.namespaces.each do |name, key|
      info[key] = namespaced_attributes_for(name).to_h
    end
  end

  def namespace_not_defined_message(name)
    <<-STRING.gsub(/^ {6}/, '').strip
      The namespace "#{name}" is not defined!

      Add it to your config using:

      Trundle.configure do |config|
        config.namespaces do
          #{name} 'unique.namespace.key'
        end
      end
    STRING
  end
end
