class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.string :name
      t.string :email
      t.date :attended_at
      t.integer :meeting_number

      t.timestamps
    end
  end
end
