class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email, null: false
      t.string  :password_digest, null: false
      t.integer :level, null: false, defautl: 0
      t.string  :f_name, null: false
      t.string  :l_name
      t.string  :phone

      t.timestamps null: false
    end
  end
end
