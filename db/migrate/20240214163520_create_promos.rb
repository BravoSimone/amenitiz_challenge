class CreatePromos < ActiveRecord::Migration[7.1]
  def change
    create_table :promos do |t|
      t.string :rule_class
      t.integer :order_id

      t.timestamps
    end
  end
end
