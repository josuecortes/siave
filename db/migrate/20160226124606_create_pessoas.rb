class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :sexo
      t.string :raca
      t.string :escolaridade
      t.string :tipo_documento
      t.string :numero_documento
      t.boolean :deficiente
      t.string :tipo_deficiencia
      t.string :nome_responsavel
      t.string :cep
      t.string :numero
      t.string :complemento

      t.timestamps null: false
    end
  end
end
