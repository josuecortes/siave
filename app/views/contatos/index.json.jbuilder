json.array!(@contatos) do |contato|
  json.extract! contato, :id, :tipo, :numero, :pessoa_id
  json.url contato_url(contato, format: :json)
end
