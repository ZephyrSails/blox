class ArticlesController < ApplicationController

  def index
    @articles_with_stamp = Article.where(stamp: params[:stamp])
    @articles = Article.where.not(stamp: "link")
  end

  def show
    @article = Article.find(params[:id])

    @wechat = Article.find_by(title: "wechat")
  end



  def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
    @page_title = "#{title}" if title.length > 0
    @meta_keywords = meta_keywords
    @meta_description = meta_description
  end

end
