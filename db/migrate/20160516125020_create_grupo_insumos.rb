class CreateGrupoInsumos < ActiveRecord::Migration
  def change
    create_table :grupo_insumos do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
