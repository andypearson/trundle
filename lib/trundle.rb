require 'trundle/config'
require 'trundle/info_store'
require 'trundle/text_bundle'
require 'trundle/text_store'
require 'trundle/version'

class Trundle
  def self.open(path)
    if block_given?
      TextBundle.new(path, &Proc.new)
    else
      TextBundle.new(path)
    end
  end

  def self.configure
    yield config
  end

  def self.config
    Config.new
  end
end
