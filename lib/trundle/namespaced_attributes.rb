class Trundle::NamespacedAttributes < OpenStruct
  def initialize(attributes = {})
    super(normalize_attributes(attributes))
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
