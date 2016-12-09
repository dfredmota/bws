class RemoveDataNascimentoToColaborador < ActiveRecord::Migration
  def change
    remove_column :colaboradores, :data_nascimento
  end
end
