class CreateOcorrencias < ActiveRecord::Migration
  def change
    create_table :ocorrencias do |t|
      t.string :numero_protocolo
      t.string :sob_influencia

      t.timestamps null: false
    end
  end
end
