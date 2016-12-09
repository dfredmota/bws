class CreateCentroCustos < ActiveRecord::Migration
  def change
    create_table :centro_custos do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
