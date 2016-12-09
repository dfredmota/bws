class CreateMateriais < ActiveRecord::Migration
  def change
    create_table :materiais do |t|
      t.string :descricao
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
