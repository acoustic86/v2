class ContactForm 
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :email, :note
  validates_presence_of :name, :email, :note
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end    
  end 
  
  def persisted?
    false
  end 
end