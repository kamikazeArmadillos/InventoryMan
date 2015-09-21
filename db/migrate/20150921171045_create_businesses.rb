class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string      :street
      t.string      :city
      t.string      :state
      t.integer     :zip
      t.integer     :store_num, null: false
      t.string      :name, null: false
      t.string      :phone, null: false

      t.timestamps null: false
    end
  end
end
