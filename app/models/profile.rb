class Profile < ActiveRecord::Base
  
  has_many :show_requests  
  belongs_to :user  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/No_Image.png"
  
  searchable do
    text :name, :show_type    
  end
end