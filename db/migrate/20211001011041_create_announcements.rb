class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :publish_id
      t.string :author
      t.datetime :publish_date
      t.string :title

      t.timestamps
    end
  end
end
