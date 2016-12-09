class CreateLocacaoMateriais < ActiveRecord::Migration
  def change
    create_table :locacao_materiais do |t|
      t.references :material, index: true, foreign_key: true
      t.references :locacao, index: true, foreign_key: true
      t.integer :qtd_locada

      t.timestamps null: false
    end
  end
end
