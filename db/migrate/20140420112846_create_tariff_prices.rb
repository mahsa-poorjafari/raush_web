class CreateTariffPrices < ActiveRecord::Migration
  def change
    create_table :tariff_prices do |t|
      t.text :modual
      t.float :unit_price
      t.integer :number

      t.timestamps
    end
  end
end
