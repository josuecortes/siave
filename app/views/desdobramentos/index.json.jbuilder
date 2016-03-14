json.array!(@desdobramentos) do |desdobramento|
  json.extract! desdobramento, :id, :descricao, :tipo_ocorrencia_id, :tipo_agressor_id
  json.url desdobramento_url(desdobramento, format: :json)
end
