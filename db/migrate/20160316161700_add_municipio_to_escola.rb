class AddMunicipioToEscola < ActiveRecord::Migration
  def change
    add_column :escolas, :municipio, :string
  end
end
