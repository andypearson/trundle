require 'active_support/inflector'

class Trundle::Key
  def initialize(key)
    @key = key.to_s
  end

  def camelize
    ActiveSupport::Inflector.camelize(@key, false).gsub(/url$/i, 'URL')
  end

  def underscore
    ActiveSupport::Inflector.underscore(@key)
  end
end
