class CreateTipoBens < ActiveRecord::Migration
  def change
    create_table :tipo_bens do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
