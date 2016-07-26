class CreateTipoDesdobramentos < ActiveRecord::Migration
  def change
    create_table :tipo_desdobramentos do |t|
      t.string :descricao
      t.integer :desdobramento_id

      t.timestamps null: false
    end
  end
end
