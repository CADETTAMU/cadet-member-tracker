class RemoveNameFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :name, :string
  end
end
