json.array!(@signatures) do |signature|
  json.extract! signature, :id
  json.url signature_url(signature, format: :json)
end
