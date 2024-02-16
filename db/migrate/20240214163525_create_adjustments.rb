class CreateAdjustments < ActiveRecord::Migration[7.1]
  def change
    create_table :adjustments do |t|
      t.decimal :amount, precision: 6, scale: 2, default: 0, null: false
      t.integer :order_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
