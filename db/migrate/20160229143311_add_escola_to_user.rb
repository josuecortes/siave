class AddEscolaToUser < ActiveRecord::Migration
  def change
    add_reference :users, :escola, index: true
    add_foreign_key :users, :escolas
  end
end
