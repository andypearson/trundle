class Trundle::AssetStore
  def initialize(path)
    @path = path
  end

  def [](file_path)
    assets[normalise_file_path(file_path)]
  end

  def length
    assets.length
  end

  private
  attr_accessor :path

  def assets
    @assets ||= Dir.glob(File.join(path, '**/*.*')).collect do |file_path|
      [normalise_file_path(file_path), Pathname.new(file_path)]
    end.to_h
  end

  def normalise_file_path(file_path)
    file_path = file_path.gsub(path, '')
    file_path = file_path.gsub(/^(\.|\/)/, '')
    file_path
  end
end
