class CreateSystemVersions < ActiveRecord::Migration
  def change
    create_table :system_versions do |t|
      t.string :version
      t.datetime :date_deploy

      t.timestamps null: false
    end
  end
end
