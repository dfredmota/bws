class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|
      t.string :razao_social
      t.string :nome_fantasia
      t.string :telefone
      t.string :endereco
      t.string :email

      t.timestamps null: false
    end
  end
end
