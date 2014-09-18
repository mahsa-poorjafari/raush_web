class RemoveArrayFieldsFromTariffOrder < ActiveRecord::Migration
  def change
    remove_column :tariff_orders, :tariff_price_ids, :integer
    remove_column :tariff_orders, :tariff_price_numbers, :integer
  end
end
