class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.references :store, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
