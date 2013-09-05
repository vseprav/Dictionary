json.array!(@vocabularies) do |vocabulary|
  json.extract! vocabulary, :title, :project_id
  json.url vocabulary_url(vocabulary, format: :json)
end
