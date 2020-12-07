class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :size, precision: 10, scale: 2
      t.boolean :spicy?
      t.boolean :best_offer?
      t.boolean :vegetarian?
      t.string :path_to_img
    
      t.timestamps
    end
    
  end
end
