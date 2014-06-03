json.array!(@subservices) do |subservice|
  json.extract! subservice, :id, :text_fa, :text_en, :title_en, :title_fa
  json.url subservice_url(subservice, format: :json)
end
