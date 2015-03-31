class Trundle::Key
  def initialize(key)
    @fragments = camelcase_url(key.to_s).split(/(?=[A-Z])/).join('_').split('_')
  end

  def camelize
    upcase_url("#{first_fragment}#{camelize_fragments(last_fragments)}")
  end

  def underscore
    @fragments.join('_').downcase
  end

  private
  def first_fragment
    @fragments[0]
  end

  def last_fragments
    @fragments.drop(1)
  end

  def camelize_fragments(fragments)
    fragments.map { |f| f.capitalize }.join('')
  end

  def upcase_url(string)
    string.gsub(/url$/i, 'URL')
  end

  def camelcase_url(string)
    string.gsub(/URL$/, 'Url')
  end
end
