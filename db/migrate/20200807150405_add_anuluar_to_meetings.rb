class AddAnuluarToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :anuluar, :boolean
  end
end
