# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t| 
      t.string :full_name
      t.string :email
      t.integer :meeting_number
      t.timestamps
    end
  end
end
