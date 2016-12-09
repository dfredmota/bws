class AddNomeLoginDeletedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :nome, :string
    add_column :users, :login, :string
    add_column :users, :deleted_at, :datetime
  end
end
