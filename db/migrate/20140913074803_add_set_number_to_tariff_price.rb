class AddSetNumberToTariffPrice < ActiveRecord::Migration
  def change
    add_column :tariff_prices, :set_number, :boolean, default: false
  end
end
