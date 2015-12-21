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

    Thread.new do
      set_geo_string
    end
    # end
    # if @cached == nil
    #   @cached ||= set_geo_string
    #   gon.greeting_words = @cached
    # end

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

  def set_geo_string
    remote_ip = request.remote_ip
    visitor = Visitor.find_by(id: remote_ip)
    prefix = "你好, Visitor from"

    if visitor != nil
      visitor.update(last_login: DateTime.now)
      return "#{prefix} #{visitor.country}, #{visitor.city}"
    end

    begin
      geo_info = HTTP.get "#{Settings.link.local_freegeoip}#{remote_ip}"
      geo_json = JSON.parse(geo_info)
      get_geo_success = true

      geo_json['country_name'] = "unknow" if geo_json['country_name'] == "" or geo_json['country_name'] == nil
      geo_json['city'] = "unknow" if geo_json['city'] == "" or geo_json['city'] == nil
      geo_json['region_name'] = "unknow" if geo_json['region_name'] == "" or geo_json['region_name'] == nil
    rescue
      get_geo_success = false
    end

    visitor = Visitor.new do |v|
      v.ip      = remote_ip
      v.country = geo_json['country_name']
      v.city    = geo_json['city']
      v.state   = geo_json['region_name']
      v.last_login = DateTime.now
    end
    visitor.save

    return = "#{prefix} #{visitor.country}, #{visitor.city}"



    puts 'see this onece'
    # gon.greeting_words = "你好, Visitor from #{geo_string}"

    return "你好, Visitor from #{geo_string}"
    # return @geo_string
    # geo_string = "uncharted land"
  end

  # def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
  #   @page_title = "#{title}" if title.length > 0
  #   @meta_keywords = meta_keywords
  #   @meta_description = meta_description
  # end

end
