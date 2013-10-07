class Request < ActiveRecord::Base
  paginates_per 10  
  belongs_to :user  
  belongs_to :profile
  acts_as_commentable
  #has_many :comments, as: :commentable
  #has_one :profile 
  
  #attr_accessible :description, :profile, :user
  
  validates_presence_of :description
end
