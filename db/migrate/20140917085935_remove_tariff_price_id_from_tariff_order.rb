class RemoveTariffPriceIdFromTariffOrder < ActiveRecord::Migration
  def change
    remove_column :tariff_orders, :tariff_price_id, :integer
  end
end
