class AddHorarioAproximadoAndLocalOcorrenciaAndEscolaAndUserToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :horario_aproximado, :time
    add_column :ocorrencias, :local_ocorrencia, :string
    add_column :ocorrencias, :escola_id, :integer
    add_column :ocorrencias, :user_id, :integer
  end
end
