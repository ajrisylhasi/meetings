class Department < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :departments
	has_secure_password
end
