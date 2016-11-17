class Article < ActiveRecord::Base
  def index
    @articles = Article.all
  end
  has_many :comments
end
