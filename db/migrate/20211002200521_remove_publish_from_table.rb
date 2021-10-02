class RemovePublishFromTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :announcements, :publish_id
  end
end
