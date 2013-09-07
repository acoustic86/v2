class Profile < ActiveRecord::Base
  
  has_many :show_requests
  
  belongs_to :user
end
