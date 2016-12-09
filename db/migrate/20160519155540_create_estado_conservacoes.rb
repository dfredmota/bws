class CreateEstadoConservacoes < ActiveRecord::Migration
  def change
    create_table :estado_conservacoes do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
