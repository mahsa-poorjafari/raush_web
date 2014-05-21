json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :title_en, :title_fa, :description_en, :description_fa, :date, :service_id, :website
  json.url portfolio_url(portfolio, format: :json)
end
