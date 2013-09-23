class Request < ActiveRecord::Base
  paginates_per 10
  
  belongs_to :user
  
  belongs_to :profile 
  #has_one :profile 
  
  #attr_accessible :description, :profile, :user
  
  validates_presence_of :description
end
