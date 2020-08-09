class AddColorToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :color, :string
    add_column :meetings, :description, :text
  end
end
