json.array!(@design_samples) do |design_sample|
  json.extract! design_sample, :id, :name, :website, :description, :date
  json.url design_sample_url(design_sample, format: :json)
end
