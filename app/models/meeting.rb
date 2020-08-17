class Meeting < ApplicationRecord
	validates_presence_of :color, :description, :start, :end
	validates_with Validator
	belongs_to :department
	belongs_to :user, optional: true
	after_save :default
	def default
		if self.color == "#cf8608"
			update_column(:title, "Takim ne Showroom - Gjakove")
		elsif self.color == "#0886cf"
			update_column(:title, "Takim ne Meeting Room")
		elsif self.color == "#03fca5"
			update_column(:title, "Takim ne Showroom - Marigona")
		elsif self.color == "#e685e1"
			update_column(:title, "Takim ne Punetoria Fushe Kosove")
		end
	end
end