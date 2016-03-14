class AddDocumentoToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :documento, :boolean
  end
end
