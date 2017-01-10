class User < ApplicationRecord
  belongs_to :owner, :performer, :promoter
  has_secure_password

  validates :first_name, :last_name, :email, :phone_number, presence:true

end
