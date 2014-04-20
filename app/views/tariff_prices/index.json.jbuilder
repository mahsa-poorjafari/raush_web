json.array!(@tariff_prices) do |tariff_price|
  json.extract! tariff_price, :id, :modual, :unit_price, :number
  json.url tariff_price_url(tariff_price, format: :json)
end
