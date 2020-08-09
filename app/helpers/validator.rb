class Validator < ActiveModel::Validator
  def validate(record)
  	if record.anuluar && Meeting.find(record.id).anuluar == record.anuluar
			return record.errors[:base] << "Takimi eshte anuluar"
		end
  	gabim = false
    unless record.title.nil?
	    meets = Meeting.all.select { |m| next if m.title != record.title || m.id == record.id; m.start.day == record.start.day || m.end.day == record.start.day }
			meets.each do |m|
				if record.start >= m.start and record.start < m.end
	      	gabim = true
				elsif record.end > m.start and record.end <= m.end
	      	gabim = true
	      elsif m.end > record.start and m.end <= record.end
	      	gabim = true
	      elsif m.start >= record.start and m.start < record.end
	      	gabim = false
				end
			end	
			record.errors[:base] << "Lokacioni eshte ne perdorim ate kohe." if gabim == true
		else
			meets = Meeting.all.select { |m| next if m.color != record.color; m.start.day == record.start.day || m.end.day == record.start.day }
			meets.each do |m|
				if record.start >= m.start and record.start < m.end
	      	gabim = true
				elsif record.end > m.start and record.end <= m.end
	      	gabim = true
	      elsif m.end > record.start and m.end <= record.end
	      	gabim = true
	      elsif m.start >= record.start and m.start < record.end
	      	gabim = false
				end
			end
			record.errors[:base] << "Lokacioni eshte ne perdorim ate kohe." if gabim == true
		end
  end

	
end