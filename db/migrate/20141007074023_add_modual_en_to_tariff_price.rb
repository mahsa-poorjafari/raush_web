class AddModualEnToTariffPrice < ActiveRecord::Migration
  def change
    add_column :tariff_prices, :modual_en, :string
  end
end
