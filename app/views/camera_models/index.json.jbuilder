json.array!(@camera_models) do |camera_model|
  json.extract! camera_model, :id, :subservice_id, :title_en, :title_fa
  json.url camera_model_url(camera_model, format: :json)
end
