class AddArrayFieldsToTariffOrder < ActiveRecord::Migration
  def change
    add_column :tariff_orders, :tariff_price_ids, :integer, array: true, null: false, default: '{}'
    add_column :tariff_orders, :tariff_price_numbers, :integer, array: true, null: false, default: '{}'
  end
end
