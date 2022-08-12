class InitializeRequirements
  def initialize
    Dir[File.join(File.dirname(__FILE__), './helpers/requirements/*.rb')].each do |key|
      temp = File.basename(key).to_s.gsub('.rb', '')
      self.class.send(:define_method, :"#{temp}") do
        klass = eval("#{temp.split('_').collect(&:capitalize).join}.new")
        instance_variable_set(:"@#{temp}", klass)
      end
    end
  end
end
