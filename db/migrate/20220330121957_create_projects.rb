class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :account_id, null: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
