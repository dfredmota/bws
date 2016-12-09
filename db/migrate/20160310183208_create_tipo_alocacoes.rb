class CreateTipoAlocacoes < ActiveRecord::Migration
  def change
    create_table :tipo_alocacoes do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
