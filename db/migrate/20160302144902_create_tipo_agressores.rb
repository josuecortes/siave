class CreateTipoAgressores < ActiveRecord::Migration
  def change
    create_table :tipo_agressores do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
