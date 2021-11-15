# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.string :name
      t.integer :uin
      t.integer :meeting_number
      t.date :attended_at

      t.timestamps
    end
  end
end
