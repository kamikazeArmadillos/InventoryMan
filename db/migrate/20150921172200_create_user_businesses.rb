class CreateUserBusinesses < ActiveRecord::Migration
  def change
    create_table :user_businesses do |t|
      t.belongs_to :user,     index: true
      t.belongs_to :business, index: true

      t.timestamps null: false
    end
  end
end
