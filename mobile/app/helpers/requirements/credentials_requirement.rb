class CredentialsRequirement
  def initialize
    @db = YAML.load_file 'app/configs/credentials.yml'
  end

  def load_crendential_details(user_details)
    @db[user_details]
  end
end
