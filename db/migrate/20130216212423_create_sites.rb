class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
