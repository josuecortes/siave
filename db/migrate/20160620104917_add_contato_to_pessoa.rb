class AddContatoToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :contato, :string
  end
end
