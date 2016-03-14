class AddDesdobramentoTipoOcorrenciaAndTipoDesdobramentoOcorrenciaAndDesdobramentoTipoAgressorAndTipoDesdobramentoAgressorToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :desdobramento_tipo_ocorrencia_id, :integer
    add_column :ocorrencias, :tipo_desdobramento_ocorrencia_id, :integer
    add_column :ocorrencias, :desdobramento_tipo_agressor_id, :integer
    add_column :ocorrencias, :tipo_desdobramento_agressor_id, :integer
  end
end
