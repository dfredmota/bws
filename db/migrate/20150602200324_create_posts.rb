class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :message
      t.string :description

      t.timestamps
    end
  end
end
