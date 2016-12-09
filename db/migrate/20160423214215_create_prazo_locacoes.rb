class CreatePrazoLocacoes < ActiveRecord::Migration
  def change
    create_table :prazo_locacoes do |t|
      t.integer :qtd_dias
      t.string :descricao

      t.timestamps null: false
    end
  end
end
