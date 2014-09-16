class AddPriceUnitToTariffPrice < ActiveRecord::Migration
  def change
    add_column :tariff_prices, :price_unit, :integer
  end
end
