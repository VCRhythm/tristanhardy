class CreateTagManifest < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.integer :post_id
      t.integer :tag_id
    end
    add_index :manifests, [:post_id, :tag_id]
  end
end
