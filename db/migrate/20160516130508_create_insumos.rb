class CreateInsumos < ActiveRecord::Migration
  def change
    create_table :insumos do |t|
      t.string :descricao
      t.references :grupo_insumo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
