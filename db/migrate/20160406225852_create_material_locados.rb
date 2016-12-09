class CreateMaterialLocados < ActiveRecord::Migration
  def change
    create_table :material_locados do |t|
      t.string :descricao
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
