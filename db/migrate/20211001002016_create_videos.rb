class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.datetime :publish_date
      t.string :title
      t.string :link
      t.string :uploader

      t.timestamps
    end
  end
end
