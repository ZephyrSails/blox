class String

  def remote_image_exists?
    begin
      url = URI.parse(self)
      Net::HTTP.start(url.host, url.port) do |http|
        return http.head(url.request_uri)['Content-Type'].start_with? 'image'
      end
    rescue
      return false
    end
  end

end
