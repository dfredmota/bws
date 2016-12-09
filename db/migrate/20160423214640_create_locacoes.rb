class CreateLocacoes < ActiveRecord::Migration
  def change
    create_table :locacoes do |t|
      t.references :fornecedor, index: true, foreign_key: true
      t.string :contrato
      t.references :prazo_locacao, index: true, foreign_key: true
      t.date :data_locacao
      t.integer :funcionario_responsavel_id, index: true
      t.string :valor_locacao

      t.timestamps null: false
    end
    add_foreign_key :locacoes, :colaboradores, column: :funcionario_responsavel_id
  end
end
