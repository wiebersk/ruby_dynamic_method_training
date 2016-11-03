require 'yaml'

class SomeOtherBetterClass

  attr_accessor :data

  def initialize
    @data = YAML.load_file('config/dynamic_data.yml')
    @data.each do |k,v|
      self.class.send(:define_method, k.to_sym) do
        puts "A #{k} says #{v}"
      end
    end
  end

  def animals_say num = 1
    Hash[@data.to_a.sample(num)].each do |k,v|
      self.send(k.to_sym)
    end
    nil
  end

  def method_missing(name, *args)
    case name.to_s
      when /^animals_say_(\d+)_things$/
        animals_say($1.to_i)
      else
        super(name, *args)
    end
  end
end