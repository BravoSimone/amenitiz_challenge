class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 7, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
