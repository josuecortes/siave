class CreateEncaminhamentos < ActiveRecord::Migration
  def change
    create_table :encaminhamentos do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
