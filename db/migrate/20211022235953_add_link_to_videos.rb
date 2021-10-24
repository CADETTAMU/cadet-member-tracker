class AddLinkToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :link, :string
  end
end
