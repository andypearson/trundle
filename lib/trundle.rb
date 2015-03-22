require 'trundle/version'

require 'trundle/info_accessors'
require 'trundle/key'

require 'trundle/text_bundle'

require 'trundle/info_store'
require 'trundle/text_store'


class Trundle
  def self.open(path)
    if block_given?
      TextBundle.new(path, &Proc.new)
    else
      TextBundle.new(path)
    end
  end
end
