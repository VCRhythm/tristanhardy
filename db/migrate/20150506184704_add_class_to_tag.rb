class AddClassToTag < ActiveRecord::Migration
  def change
    add_column :tags, :category, :string
  end
end
