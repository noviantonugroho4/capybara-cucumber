# rubocop:disable Security/YAMLLoad
require 'erb'

class PlatformSelector
  def select(platform)
    p "setting appium capabilities to #{platform}"
    template = ERB.new File.new('app/configs/devices.yml.erb').read
    caps = YAML.load template.result(binding)

    caps[platform]
  end
end
# rubocop:enable Security/YAMLLoad
#
