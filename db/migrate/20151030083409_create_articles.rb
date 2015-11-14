class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title,       null: false
      t.string  :content,     null: false
      t.text    :body,        null: false
      t.integer :view_count
      t.integer :reply_count
      t.integer :writer_id

      t.belongs_to :writers

      t.timestamps null: false
    end
  end
end
