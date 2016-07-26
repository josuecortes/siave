class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :pessoas, :ocorrencias do |t|
      t.index [:pessoa_id, :ocorrencia_id]
      t.index [:ocorrencia_id, :pessoa_id]
    end
  end
end
