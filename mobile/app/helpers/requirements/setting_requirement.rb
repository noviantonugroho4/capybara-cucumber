class SettingRequirement
  include DataMagic

  def initialize
    DataMagic.load 'setting.yml'
  end

  def load_setting_details(key)
    data_for "setting/#{key}"
  end
end
