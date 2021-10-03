class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.string :email
      t.string :full_name
      t.string :uid
      t.string :avatar_url
      t.string :index_admins_on_email

      t.timestamps
    end
    add_index :attendances, :index_admins_on_email
  end
end
