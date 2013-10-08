class Profile < ActiveRecord::Base
  
  has_many :requests  
  belongs_to :user  
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "250x250>" }, :default_url => "/images/:style/No_Image.png"
  paginates_per 50
  
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100#',
    square: '1024x680>',
    medium: '300x300#'
  },
  :default_url => "/images/:style/No_Image.png"
  #:s3_credentials => S3_CREDENTIALS,
  #:storage => :s3,
  

  
  #searchable do
    #text :name, :profession, :latitude, :longitude    
  #end
  
  geocoded_by :current_location
  after_validation :geocode, :if => :current_location_changed?
end