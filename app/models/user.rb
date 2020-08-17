class User < ApplicationRecord
	belongs_to :department
	has_many :meetings
	before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true
end
