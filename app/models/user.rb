class User < ApplicationRecord
	belongs_to :department
	has_many :meetings
	before_save { self.email = email.downcase; self.name = self.name.strip }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true

    before_destroy { self.meetings.each { |m| self.meetings.delete(m)}}
end
