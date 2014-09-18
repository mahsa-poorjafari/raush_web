class AddTariffPriceIdToTariffOrder < ActiveRecord::Migration
  def change
    add_column :tariff_orders, :tariff_price_id, :integer
  end
end
