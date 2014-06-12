class AddFieldToTariffPrice < ActiveRecord::Migration
  def change
    add_column :tariff_prices, :service_id, :integer
  end
end
