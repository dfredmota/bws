class AddQtdDisponivelToBem < ActiveRecord::Migration
  def change
    add_column :bens, :qtd_disponivel, :integer
  end
end
