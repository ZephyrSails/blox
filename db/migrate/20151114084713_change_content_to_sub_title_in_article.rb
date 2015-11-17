class ChangeContentToSubTitleInArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :content, :subtitle
  end
end
