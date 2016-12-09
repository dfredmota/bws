class CreatePrazoLocacaos < ActiveRecord::Migration
  def change
    create_table :prazo_locacaos do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
