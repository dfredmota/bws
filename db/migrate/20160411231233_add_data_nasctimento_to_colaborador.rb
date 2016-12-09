class AddDataNasctimentoToColaborador < ActiveRecord::Migration
  def change
    add_column :colaboradores, :data_nascimento, :date
  end
end
