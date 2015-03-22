class Trundle::Config
  attr_accessor(
    :version,
    :transient,
    :creator_url,
    :source_url,
    :creator_identifier,
    :type
  )

  def initialize
    @version = 2
    @transient = false
  end

  # TODO: raise exception when transient is not being set to a boolean
end
