class DelMeetsController < ApplicationController
  before_action { redirect_to meetings_path if !(@current_user == nil && @current_dep == Department.find_by(name: "IT")) }
  def weirdName
	end

	def deleteMeets
		meets = Meeting.all.select { |m| m.end.to_date < 3.days.ago }
		meets.each do |a|
			a.destroy
		end
		redirect_to root_path
	end
end
