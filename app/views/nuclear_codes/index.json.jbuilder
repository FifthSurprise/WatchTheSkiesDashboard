json.array!(@nuclear_codes) do |nuclear_code|
  json.extract! nuclear_code, :id
  json.url nuclear_code_url(nuclear_code, format: :json)
end
