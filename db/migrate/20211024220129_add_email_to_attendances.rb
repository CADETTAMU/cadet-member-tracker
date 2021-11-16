# frozen_string_literal: true

class AddEmailToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :email, :string
  end
end
