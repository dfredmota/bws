class CreateAlmoxarifes < ActiveRecord::Migration
  def change
    create_table :almoxarifes do |t|
      t.references :colaborador, index: true, foreign_key: true
      t.references :centro_custo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
