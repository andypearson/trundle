class Trundle::Config
  attr_accessor(
    :creator_identifier,
    :creator_url,
    :source_url,
    :transient,
    :type,
    :version
  )

  def initialize
    @version = 2
    @transient = false
  end

  def namespace?(name)
    namespace_list.include?(name)
  end

  def namespace_key(name)
    namespace_list.key(name)
  end

  def namespaces(&block)
    if block_given?
      namespace_list.instance_eval(&block)
    else
      namespace_list.all
    end
  end

  def transient=(value)
    raise ArgumentError, 'transient must be a boolean' unless !!value == value
    @transient = value
  end

  def to_h
    hash = {}
    keys.each do |key|
      value = send(key)
      hash[Trundle::Key.new(key).camelize] = value if !value.nil?
    end
    hash
  end

  private
  def keys
    [
      :creator_identifier,
      :creator_url,
      :source_url,
      :transient,
      :type,
      :version
    ]
  end

  def namespace_list
    @namespace_list ||= Trundle::NamespaceList.new
  end
end
