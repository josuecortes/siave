class CreateDesdobramentos < ActiveRecord::Migration
  def change
    create_table :desdobramentos do |t|
      t.string :descricao
      t.integer :tipo_ocorrencia_id
      t.integer :tipo_agressor_id

      t.timestamps null: false
    end
  end
end
