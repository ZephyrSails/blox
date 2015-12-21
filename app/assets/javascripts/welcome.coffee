# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  visitInit()
  # alert "page has loaded!"

visitInit = () ->
  greeting()

greeting = () ->
  if gon.greeting_words[0]
    $('#greeting').text("I'm a programmer")
    delay 1600, ->
      $('#greeting').fadeOut(800)
      delay 800, ->
        $('#greeting').text(gon.greeting_words[1])
        $('#greeting').fadeIn(800)
    # alert "nihao"
  else
    $('#greeting').text(gon.greeting_words[1])

  # if geo_string
  # json = JSON.parse(data)


delay = (ms, func) -> setTimeout func, ms

# @paintIt = (element, backgroundColor, ipAddress) ->
  # element.style.backgroundColor = backgroundColor

  # ipAddress = "183.62.57.157" if ipAddress == "::1"

  # $.ajax "#{Settings.link.local_freegeoip}#{ipAddress}",
  #     type: 'GET'
  #     dataType: 'html'
  #     error: (jqXHR, textStatus, errorThrown) ->
  #       alert "error"
  #         # $('body').append "AJAX Error: #{textStatus}"
  #     success: (data, textStatus, jqXHR) ->
  #       json = JSON.parse(data)
  #       alert "#{json['country_name']}, #{json['city']}"




      # return "你好, Visitor from #{geo_string}"

  # remote_ip = "#{@remote_ip}"
  # remote_ip = "183.62.57.157" if remote_ip == "::1"
  # # alert user_name
  #
  # $.ajax "http://127.0.0.1:8081/json/#{remote_ip}",
  #     headers: {"accept-language": "en-US"}
  #     type: 'GET'
  #     dataType: 'html'
  #     error: (jqXHR, textStatus, errorThrown) ->
  #       # $('#greeting').text("你好, Visitor from #{json['country_name']}, #{json['city']}")
  #     success: (data, textStatus, jqXHR) ->
  #       json = JSON.parse(data)
  #       delay 2000, ->
  #         $('#greeting').fadeOut(500)
  #         delay 500, ->
  #           $('#greeting').text("你好, Visitor from #{json['country_name']}, #{json['city']}")
  #           $('#greeting').fadeIn(500)



# remote_ip = request.remote_ip
# geo_result = HTTP.get "https://freegeoip.net/json/#{remote_ip}"
# @geo_json = JSON.parse(geo_result)
# { "ip":"66.155.104.121",
#   "country_code":"US",
#   "country_name":"美国",
#   "region_code":"GA",
#   "region_name":"Georgia",
#   "city":"亚特兰大",
#   "zip_code":"30303",
#   "time_zone":"America/New_York",
#   "latitude":33.7516,
#   "longitude":-84.3915,
#   "metro_code":524
# }
          # $('body').append "Successful AJAX call: #{data}"


  # alert ipAddress

  # if textColor?
  #   element.style.color = textColor
  #   alert "110"


  # element.style.backgroundColor = backgroundColor
  # if textColor?
  #   element.style.color = textColor


    # Advanced Settings
    # $.getJSON('getip.php', function(data){
    #   alert('Your ip is: ' +  data.ip);
    #   });

    # $.ajax '/',
    #     type: 'GET'
    #     dataType: 'html'
    #     error: (jqXHR, textStatus, errorThrown) ->
    #         $('body').append "AJAX Error: #{textStatus}"
    #     success: (data, textStatus, jqXHR) ->
    #         $('body').append "Successful AJAX call: #{data}"
