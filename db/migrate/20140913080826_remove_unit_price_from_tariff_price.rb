class RemoveUnitPriceFromTariffPrice < ActiveRecord::Migration
  def change
    remove_column :tariff_prices, :unit_price, :float
  end
end
