class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :nickname
      t.string :website
      t.string :email,      null: false

      t.timestamps          null: false
    end
  end
end
