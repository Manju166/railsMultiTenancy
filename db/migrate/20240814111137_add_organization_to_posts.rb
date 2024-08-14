class AddOrganizationToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :organization, :integer,null: false
    add_index :posts, :organization_id
  end
end
