json.array!(@services) do |service|
  json.extract! service, :id, :title_en, :title_fa, :description_en, :description_fa
  json.url service_url(service, format: :json)
end
