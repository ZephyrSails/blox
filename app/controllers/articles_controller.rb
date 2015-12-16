class ArticlesController < ApplicationController

  def index
    # @articles_with_stamp = Article.where(stamp: params[:stamp])
    @articles = Article.where.not(stamp: "link")

    if params[:stamp] == "all" or params[:stamp] == nil
      @articles = Article.where.not(stamp: "link").reverse
    elsif Settings.article_stamps.include? params[:stamp]
      @articles = Article.where(stamp: params[:stamp]).reverse
    else
      @articles = Settings.error
    end

  end

  def show
    if params[:id] != nil # Article
      @is_article = true
    end

    if @is_article
      @article = Article.find(params[:id])
    elsif params[:stamp]
      @article = Article.find_by(title: params[:stamp])
    else
    end

    if @article.header != nil and @article.header.remote_image_exists?
      @header_url = @article.header
    else
      if @is_article
        @header_url = ActionController::Base.helpers.asset_path Settings.backgrounds.article
      else
        @header_url = ActionController::Base.helpers.asset_path Settings.backgrounds.link
      end
    end

  end

  def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
    @page_title = "#{title}" if title.length > 0
    @meta_keywords = meta_keywords
    @meta_description = meta_description
  end

end
