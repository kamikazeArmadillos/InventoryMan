class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :level, null: false, default: 0
      t.string  :f_name
      t.string  :l_name
      t.string  :phone

      t.timestamps null: false
    end
  end
end
