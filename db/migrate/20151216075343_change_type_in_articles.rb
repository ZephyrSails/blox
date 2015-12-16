class ChangeTypeInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :type, :stamp
  end
end
