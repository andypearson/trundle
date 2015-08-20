require 'trundle/version'
require 'trundle/info_accessors'

require 'trundle/asset_store'
require 'trundle/config'
require 'trundle/info_store'
require 'trundle/key'
require 'trundle/namespace_list'
require 'trundle/namespaced_attributes'
require 'trundle/text_bundle'
require 'trundle/text_store'

module Trundle

  class NamespaceNotDefined < StandardError; end

  def self.open(path)
    return TextBundle.new(path, &Proc.new) if block_given?
    TextBundle.new(path)
  end

  def self.configure
    yield config
  end

  def self.config
    @config ||= Config.new
  end
end
