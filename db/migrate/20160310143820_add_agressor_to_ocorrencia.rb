class AddAgressorToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencias, :agressor_id, :integer
  end
end
