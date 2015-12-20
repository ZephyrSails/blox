class ArticlesController < ApplicationController

  def index
    # @articles_with_stamp = Article.where(stamp: params[:stamp])
    @articles = Article.where.not(stamp: "link").order("created_at DESC")

    if params[:stamp] == "all" or params[:stamp] == nil
      @articles = Article.where.not(stamp: "link").order("created_at DESC")
    elsif Settings.article_stamps.include? params[:stamp]
      @articles = Article.where(stamp: params[:stamp]).order("created_at DESC")
    else
      @articles = Settings.error
    end

    @geo_string = get_geo_string
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

  def get_geo_string
    remote_ip = request.remote_ip

    puts remote_ip
    puts "wozhenshirilegoule"

    begin
      geo_info = HTTP.get "#{Settings.link.local_freegeoip}#{remote_ip}"
      geo_json = JSON.parse(geo_info)
      #{json['country_name']}, #{json['city']
      geo_string = "#{geo_json['country_name']}, #{geo_json['city']}"

      if geo_string == "" or geo_string == nil
        raise
      end
    rescue
      geo_string = "uncharted land"
    end
    return geo_string
    # geo_string = "uncharted land"
  end


  # def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
  #   @page_title = "#{title}" if title.length > 0
  #   @meta_keywords = meta_keywords
  #   @meta_description = meta_description
  # end

end
