class InitializeScreens
  attr_accessor :platform
  SECTION_LIST = ['common_screen'].freeze

  def initialize(platform)
    Dir[File.join(File.dirname(__FILE__), "../screens/#{platform}/*.rb")].each do |key|
      temp = File.basename(key).to_s.gsub('.rb', '')
      self.class.send(:define_method, :"#{temp}") do
        next if SECTION_LIST.include? temp

        klass = eval("::#{platform.capitalize}::#{temp.split('_').collect(&:capitalize).join}.new")
        instance_variable_set(:"@#{temp}", klass)
      end
    end
  end
end
