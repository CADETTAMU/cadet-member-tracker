# frozen_string_literal: true

class CreateAffiliateOrgs < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliate_orgs do |t|
      t.string :org_name
      t.string :org_link
      t.string :org_desc

      t.timestamps
    end
  end
end
