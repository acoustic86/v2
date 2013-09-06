class Profile < ActiveRecord::Base
  
  has_many :show_requests
end
