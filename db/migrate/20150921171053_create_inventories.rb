class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to  :business, index: true

      t.string      :name, null: false
      t.integer     :count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
