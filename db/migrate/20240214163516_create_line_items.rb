class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.decimal :price, precision: 6, scale: 2, default: 0, null: false
      t.decimal :final_price, precision: 6, scale: 2, default: 0, null: false
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
