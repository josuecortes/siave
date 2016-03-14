class AddEncaminhamentoToOcorrencia < ActiveRecord::Migration
  def change
    add_reference :ocorrencias, :encaminhamento, index: true
    add_foreign_key :ocorrencias, :encaminhamentos
  end
end
