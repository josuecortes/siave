class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :tipo
      t.string :numero
      t.references :pessoa, index: true

      t.timestamps null: false
    end
    add_foreign_key :contatos, :pessoas
  end
end
