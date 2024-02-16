class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.decimal :price, precision: 6, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
