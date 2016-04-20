class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :label1
      t.string :label2
      t.string :label3
      t.string :filename
      t.binary :bin
      t.integer :fav

      t.timestamps null: false
    end
  end
end
