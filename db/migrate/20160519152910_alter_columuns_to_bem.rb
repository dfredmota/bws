class AlterColumunsToBem < ActiveRecord::Migration
  def change
    remove_column :bens, :grupo_insumo, :string
    remove_column :bens, :insumo, :string
    add_reference :bens, :grupo_insumo, index: true, foreign_key: true
    add_reference :bens, :insumo, index: true, foreign_key: true
  end

end
