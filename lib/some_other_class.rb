require 'yaml'

class SomeOtherClass

  attr_accessor :data

  def initialize
    @data = YAML.load_file('config/dynamic_data.yml')
  end

  def method_missing(name, *args)
    if @data[name.to_s]
      puts "A #{name} says #{@data[name.to_s]}"
    else
      puts "#{name} is not a key in #{@data}"
    end
  end
end