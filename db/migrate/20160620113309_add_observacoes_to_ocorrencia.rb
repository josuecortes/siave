class AddObservacoesToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :observacoes, :text
  end
end
