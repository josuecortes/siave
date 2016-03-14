class AddAgredidoToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :agredido_id, :integer
  end
end
