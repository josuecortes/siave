json.array!(@encaminhamentos) do |encaminhamento|
  json.extract! encaminhamento, :id, :descricao
  json.url encaminhamento_url(encaminhamento, format: :json)
end
