class CreateLastNames < ActiveRecord::Migration
  def change
    create_table :last_names do |t|
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
