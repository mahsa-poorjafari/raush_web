class CreateTariffOrders < ActiveRecord::Migration
  def change
    create_table :tariff_orders do |t|
      t.integer :order_online_id
      t.integer :tariff_price_id
      t.integer :modual_number

      t.timestamps
    end
  end
end
