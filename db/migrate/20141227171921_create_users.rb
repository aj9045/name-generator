class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :about

      t.timestamps
    end
  end
end
