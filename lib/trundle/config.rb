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

  # TODO: raise exception when transient is not being set to a boolean
end
