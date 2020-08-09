class DelMeetsController < ApplicationController
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
