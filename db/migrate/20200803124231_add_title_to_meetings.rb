class AddTitleToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :title, :string
  end
end
