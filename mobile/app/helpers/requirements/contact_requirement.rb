class ContactRequirement
  include DataMagic

  def initialize
    DataMagic.load 'contact.yml'
  end

  def load_contact_details(key)
    data_for "contact/#{key}"
  end
end
