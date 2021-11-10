class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :Name
      t.integer :Number
      t.datetime :StartTime

      t.timestamps
    end
  end
end
