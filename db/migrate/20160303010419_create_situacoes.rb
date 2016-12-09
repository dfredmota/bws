class CreateSituacoes < ActiveRecord::Migration
  def change
    create_table :situacoes do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
