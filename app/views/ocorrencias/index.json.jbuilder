json.array!(@ocorrencias) do |ocorrencia|
  json.extract! ocorrencia, :id, :numero_protocolo, :sob_influencia
  json.url ocorrencia_url(ocorrencia, format: :json)
end
