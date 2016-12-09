class AddQtdDiasToPrazoLocacao < ActiveRecord::Migration
  def change
    add_column :prazo_locacaos, :qtd_dias, :integer
  end
end
