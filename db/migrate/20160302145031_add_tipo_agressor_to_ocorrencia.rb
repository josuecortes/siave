class AddTipoAgressorToOcorrencia < ActiveRecord::Migration
  def change
    add_reference :ocorrencias, :tipo_agressor, index: true
    add_foreign_key :ocorrencias, :tipo_agressores
  end
end
