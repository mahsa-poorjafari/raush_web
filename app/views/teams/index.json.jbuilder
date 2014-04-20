json.array!(@teams) do |team|
  json.extract! team, :id, :name, :last_name, :post
  json.url team_url(team, format: :json)
end
