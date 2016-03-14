json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :data_nascimento, :sexo, :raca, :escolaridade, :tipo_documento, :numero_documento, :deficiente, :tipo_deficiencia, :nome_responsavel, :cep, :numero, :complemento
  json.url pessoa_url(pessoa, format: :json)
end
