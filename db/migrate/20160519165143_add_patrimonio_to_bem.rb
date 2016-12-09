class AddPatrimonioToBem < ActiveRecord::Migration
  def change
    add_column :bens, :patrimonio, :numeric
  end
end
