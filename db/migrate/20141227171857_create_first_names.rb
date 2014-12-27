class CreateFirstNames < ActiveRecord::Migration
  def change
    create_table :first_names do |t|
      t.first_name

      t.timestamps
    end
  end
end
