class AddCodigoToEscola < ActiveRecord::Migration
  def change
    add_column :escolas, :codigo, :string
  end
end
