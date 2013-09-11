class ShowRequest < ActiveRecord::Base
  
  belongs_to :profile
  
  belongs_to :user
  
  validates_presence_of :description
end
