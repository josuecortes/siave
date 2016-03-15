class AddDataOcorrenciaToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :data_ocorrencia, :date
  end
end
