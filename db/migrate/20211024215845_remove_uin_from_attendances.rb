class RemoveUinFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :uin, :integer
  end
end
