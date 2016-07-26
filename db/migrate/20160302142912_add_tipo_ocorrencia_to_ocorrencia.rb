class AddTipoOcorrenciaToOcorrencia < ActiveRecord::Migration
  def change
    add_reference :ocorrencias, :tipo_ocorrencia, index: true
    add_foreign_key :ocorrencias, :tipo_ocorrencias
  end
end
