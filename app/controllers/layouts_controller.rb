class LayoutsController < ApplicationController

  def application
    puts "layouts loaded"
    set_geo_string
  end

  def set_geo_string
    remote_ip = request.remote_ip

    puts remote_ip

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

    gon.greeting_words = "你好, Visitor from #{geo_string}"

    return true
    # return @geo_string
    # geo_string = "uncharted land"
  end
end
