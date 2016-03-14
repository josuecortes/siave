json.array!(@escolas) do |escola|
  json.extract! escola, :id, :nome, :cep, :numero, :email, :contato
  json.url escola_url(escola, format: :json)
end
