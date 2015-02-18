class AddPathToTag < ActiveRecord::Migration
  def change
    add_column :tags, :path, :string
  end
end
