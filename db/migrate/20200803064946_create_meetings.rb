class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
