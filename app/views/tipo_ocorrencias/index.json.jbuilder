json.array!(@tipo_ocorrencias) do |tipo_ocorrencia|
  json.extract! tipo_ocorrencia, :id, :descricao
  json.url tipo_ocorrencia_url(tipo_ocorrencia, format: :json)
end
