class Trundle::NamespacedAttributes < OpenStruct
  def initialize(attributes = {})
    super(normalize_attributes(attributes))
  end

  def to_h
    attrs = {}
    super.to_h.each do |key, value|
      attrs[Trundle::Key.new(key).camelize] = value
    end
    attrs
  end

  private
  def normalize_attributes(attributes)
    normalized_attributes = {}
    attributes.each do |key, value|
      key = Trundle::Key.new(key).underscore
      normalized_attributes[key] = value
    end
    normalized_attributes
  end
end
