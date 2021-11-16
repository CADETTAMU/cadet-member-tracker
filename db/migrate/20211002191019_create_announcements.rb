# frozen_string_literal: true

class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :author_announce
      t.datetime :publish_date

      t.timestamps
    end
  end
end
