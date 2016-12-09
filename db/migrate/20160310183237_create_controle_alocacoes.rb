class CreateControleAlocacoes < ActiveRecord::Migration
  def change
    create_table :controle_alocacoes do |t|
      t.datetime :data_transferencia
      t.integer :entregador_id, index: true#, foreign_key: true
      t.integer :recebedor_id, index: true
      t.references :centro_custo, index: true, foreign_key: true
      t.references :tipo_alocacao, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :controle_alocacoes, :colaboradores, column: :entregador_id
    add_foreign_key :controle_alocacoes, :colaboradores, column: :recebedor_id
  end
end
