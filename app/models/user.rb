class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #attr_accessible :email
         
  has_many :profiles
  #accepts_nested_attributes_for :profiles
  #has_many :requests, through: :profiles
  has_many :requests
 #accepts_nested_attributes_for :requests
 
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
   def stripe_recipient
    return nil if stripe_recipient_id.nil?
    Stripe::Recipient.retrieve stripe_recipient_id
   end
end
