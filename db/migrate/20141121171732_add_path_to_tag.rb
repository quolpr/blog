class AddPathToTag < ActiveRecord::Migration
  def change
    add_column :tags, :path, :string, null:false
  end
end
