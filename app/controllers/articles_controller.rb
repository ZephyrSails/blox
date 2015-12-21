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


    gon.greeting_words = ""
    @greeting_words = get_geo_string
    gon.greeting_words = @greeting_words

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

  def get_geo_string
    remote_ip = request.remote_ip.to_s
    visitor = Visitor.find_by(ip: remote_ip)
    prefix = Settings.geo_greeting.prefix
    unknow = Settings.geo_greeting.ip_geo_unknow

    if visitor != nil
      expired = ((Time.now - visitor.last_login) > Settings.geo_greeting.expire_sec) ? true : false
      # if (Time.now - visitor.last_login) > Settings.geo_greeting.expire_sec
      #   expired = true
      # else
      #   expired = false
      # end
      visitor.update(last_login: DateTime.now)
      region = visitor.country == unknow ? unknow : "#{visitor.country}, #{visitor.city}"
      # if visitor.country == unknow
      #   region = unknow
      # else
      #   region = "#{visitor.country}, #{visitor.city}"
      # end
      return [expired, "#{prefix} #{region}"]
    end

    begin
      geo_info = HTTP.get "#{Settings.link.local_freegeoip}#{remote_ip}"
      geo_json = JSON.parse(geo_info)
      get_geo_success = true

      country = (geo_json['country_name'] == "" or geo_json['country_name'] == nil) ? unknow : geo_json['country_name']
      city = (geo_json['city'] == "" or geo_json['city'] == nil) ? unknow : geo_json['city']
      state = (geo_json['region_name'] == "" or geo_json['region_name'] == nil) ? unknow : geo_json['region_name']

      # if geo_json['country_name'] == "" or geo_json['country_name'] == nil
      #   country = unknow
      # else
      #   country = geo_json['country_name']
      # end
      # if geo_json['city'] == "" or geo_json['city'] == nil
      #   city = unknow
      # else
      #   city = geo_json['city']
      # end
      # if geo_json['region_name'] == "" or geo_json['region_name'] == nil
      #   state = unknow
      # else
      #   state = geo_json['region_name']
      # end

    rescue
      get_geo_success = false
      country = unknow
      city = unknow
      state = unknow
    end

    visitor = Visitor.new do |v|
      v.ip      = remote_ip
      v.country = country
      v.city    = city
      v.state   = state
      v.last_login = DateTime.now
    end
    visitor.save

    return [true, "#{prefix} #{visitor.country}, #{visitor.city}"]

  end

  # def set_seo_meta(title = '', meta_keywords = '', meta_description = '')
  #   @page_title = "#{title}" if title.length > 0
  #   @meta_keywords = meta_keywords
  #   @meta_description = meta_description
  # end

end
