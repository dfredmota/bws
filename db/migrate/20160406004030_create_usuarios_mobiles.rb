class CreateUsuariosMobiles < ActiveRecord::Migration
  def change
    create_table :usuarios_mobiles do |t|
      t.string :login
      t.string :senha
      t.references :colaborador, index: true, foreign_key: true
      t.boolean :super_usuario

      t.timestamps null: false
    end
  end
end
