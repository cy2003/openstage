class User < ApplicationRecord
  has_one :owner
  has_one :performer
  has_one :promoter
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true
  validates :phone_number, presence:true
  has_secure_password

  def full_name
  	"#{self.first_name} #{self.last_name}"
  end
  
end
