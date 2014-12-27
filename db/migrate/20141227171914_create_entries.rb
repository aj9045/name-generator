class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :note

      t.references :first_name, null: false
      t.references :last_name, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
