class ModRate < ActiveRecord::Migration
  def change
    rename_column :images, :fav, :rate
  end
end
