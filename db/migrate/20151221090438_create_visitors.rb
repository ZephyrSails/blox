class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip
      t.string :country
      t.string :state
      t.string :city
      t.datetime :last_login

      t.timestamps null: false
    end
    add_index :visitors, :ip
  end
end
