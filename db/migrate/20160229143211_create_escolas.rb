class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :cep
      t.string :numero
      t.string :email
      t.string :contato

      t.timestamps null: false
    end
  end
end
