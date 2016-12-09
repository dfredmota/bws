class CreateBens < ActiveRecord::Migration
  def change
    create_table :bens do |t|
      t.string :grupo_insumo
      t.string :insumo
      t.string :marca
      t.string :modelo
      t.string :numero_serie
      t.string :detalhamento
      t.string :observacao
      t.money :valor
      t.string :nota_fiscal
      t.string :data_compra
      t.references :situacao, index: true, foreign_key: true
      t.string :estado_conservacao
      t.references :centro_custo, index: true, foreign_key: true
      t.references :setor, index: true, foreign_key: true
      t.references :colaborador, index: true, foreign_key: true
      t.references :tipo_bem, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
