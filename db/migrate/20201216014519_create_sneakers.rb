class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.float :price
      t.string :sport
      t.float :size
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
