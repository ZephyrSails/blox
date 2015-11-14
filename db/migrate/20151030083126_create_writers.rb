class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string   :email,                           null: false
      t.string   :name,                            null: false
      t.string   :location
      t.string   :bio
      t.string   :website
      t.boolean  :verfied
      t.integer  :authority
      t.string   :encrypted_password, default: "", null: false
      t.string   :current_login_ip
      t.string   :last_login_ip
      t.datetime :last_login_at

      t.timestamps null: false
    end
  end
end
