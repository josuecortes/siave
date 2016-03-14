class CreateTipoOcorrencias < ActiveRecord::Migration
  def change
    create_table :tipo_ocorrencias do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
