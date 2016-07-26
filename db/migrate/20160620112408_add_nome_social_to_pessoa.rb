class AddNomeSocialToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :nome_social, :string
  end
end
