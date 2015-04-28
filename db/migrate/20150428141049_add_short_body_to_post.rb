class AddShortBodyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :short_body, :text
  end
end
