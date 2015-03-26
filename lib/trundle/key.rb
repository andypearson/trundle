class Trundle::Key
  def initialize(key)
    @fragments = key.to_s.split('_')
  end

  def camelize
    upcase_url("#{first_fragment}#{camelize_fragments(last_fragments)}")
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
end
