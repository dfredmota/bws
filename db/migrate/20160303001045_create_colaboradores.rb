class CreateColaboradores < ActiveRecord::Migration
  def change
    create_table :colaboradores do |t|
      t.string :nome
      t.string :cpf
      t.string :data_nascimento
      t.references :funcao, index: true, foreign_key: true
      t.datetime :data_admissao
      t.datetime :data_demissao
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
