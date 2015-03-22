module Trundle::InfoAccessors
  def info_accessors(*args)
    args.each do |arg|
      key = Trundle::Key.new(arg.to_s).camelize

      define_method(arg) do
        info[key]
      end

      define_method("#{arg}=") do |value|
        info[key] = value
      end
    end
  end
end
