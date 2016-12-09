class CreateBensAlocacao < ActiveRecord::Migration
  def change
    create_table :bens_alocacao do |t|
      t.references :bem, index: true, foreign_key: true
      t.references :controle_alocacao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
