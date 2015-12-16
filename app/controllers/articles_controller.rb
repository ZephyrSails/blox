class ArticlesController < ApplicationController

  def index
    @articles_with_stamp = Article.where(stamp: params[:stamp])
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end



  def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
    @page_title = "#{title}" if title.length > 0
    @meta_keywords = meta_keywords
    @meta_description = meta_description
  end

end
