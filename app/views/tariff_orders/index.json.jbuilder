json.array!(@tariff_orders) do |tariff_order|
  json.extract! tariff_order, :id, :user_order_id, :tariff_price_id, :modual_number
  json.url tariff_order_url(tariff_order, format: :json)
end
