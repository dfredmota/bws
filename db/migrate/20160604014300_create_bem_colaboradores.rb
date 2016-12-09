class CreateBemColaboradores < ActiveRecord::Migration
  def change
    create_table :bem_colaboradores do |t|
      t.references :bem, index: true, foreign_key: true
      t.references :colaborador, index: true, foreign_key: true
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
