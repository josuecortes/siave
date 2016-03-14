json.array!(@tipo_agressores) do |tipo_agressor|
  json.extract! tipo_agressor, :id, :descricao
  json.url tipo_agressor_url(tipo_agressor, format: :json)
end
