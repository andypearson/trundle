class Trundle::NamespaceList
  def initialize
    @namespaces = {}
  end

  def include?(name)
    @namespaces.has_key? name.to_sym
  end

  def key(name)
    @namespaces[name.to_sym]
  end

  def all
    @namespaces
  end

  def method_missing(name, *args, &block)
    @namespaces[name.to_sym] = args[0]
  end
end
