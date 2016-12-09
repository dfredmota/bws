class AddQuantidadeAlocadaToBemAlocacao < ActiveRecord::Migration
  def change
    add_column :bens_alocacao, :quantidade_alocada, :integer
  end
end
