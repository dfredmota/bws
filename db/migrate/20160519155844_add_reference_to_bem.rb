class AddReferenceToBem < ActiveRecord::Migration
  def change
    remove_column :bens, :estado_conservacao, :string
    add_reference :bens, :estado_conservacao, index: true, foreign_key: true
  end
end
