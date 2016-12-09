class AddCnpjToFornecedor < ActiveRecord::Migration
  def change
    add_column :fornecedores, :cnpj, :string, limit: 20
  end
end
