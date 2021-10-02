class RemovePublishIdFromTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :publish_id
  end
end
