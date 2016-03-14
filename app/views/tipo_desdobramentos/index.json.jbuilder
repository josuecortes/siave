json.array!(@tipo_desdobramentos) do |tipo_desdobramento|
  json.extract! tipo_desdobramento, :id, :descricao, :desdobramento_id
  json.url tipo_desdobramento_url(tipo_desdobramento, format: :json)
end
