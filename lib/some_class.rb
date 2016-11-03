require 'yaml'

class SomeClass

  def initialize
    @data = YAML.load_file('config/dynamic_data.yml')
    @data.each do |k,v|
      self.class.send(:define_method, k.to_sym) do
        puts "A #{k} says #{v}"
      end
    end
  end
end