class User < ApplicationRecord
	has_secure_password
	belongs_to :department
	before_save :default
	has_many :meetings

	def default
	end
end
