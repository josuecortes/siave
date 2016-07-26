class AddLogradouroAndBairroAndCidadeToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :logradouro, :string
    add_column :pessoas, :cidade, :string
    add_column :pessoas, :bairro, :string
  end
end
