class CreateColaboradorTelefones < ActiveRecord::Migration
  def change
    create_table :colaborador_telefones do |t|
      t.string :ddd, limit: 5
      t.string :numero, limit: 20
      t.integer :colaborador_id

      t.timestamps null: false
    end
  end
end
