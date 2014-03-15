class Request < ActiveRecord::Base
  paginates_per 10  
  belongs_to :user  
  belongs_to :profile
  acts_as_commentable
  
  before_create :type_designation
  #has_many :comments, as: :commentable
  #has_one :profile 
  
  #attr_accessible :description, :profile, :user
  
  #validates_presence_of :description
  validates :price, :numericality => {:less_than => 10000.00}
  
  private
  
  def type_designation
    if self.user == self.profile.user
      self.offering = true
    end
  end
  
end
