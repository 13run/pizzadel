class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.text :client_name
      t.text :client_phone
      t.text :client_address
      t.text :order

      t.timestamps
    end
    
  end
end
