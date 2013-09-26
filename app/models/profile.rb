class Profile < ActiveRecord::Base
  
  has_many :requests  
  belongs_to :user  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/No_Image.png"
  paginates_per 50
  
  searchable do
    text :name, :show_type, :latitude, :longitude    
  end
  
  geocoded_by :current_location
  after_validation :geocode, :if => :current_location_changed?
end