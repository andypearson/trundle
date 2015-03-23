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

  def transient=(value)
    raise ArgumentError, 'transient must be a boolean' unless !!value == value
    @transient = value
  end
end
