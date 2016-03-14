class AddTipoToDesdobramento < ActiveRecord::Migration
  def change
    add_column :desdobramentos, :tipo, :string
  end
end
