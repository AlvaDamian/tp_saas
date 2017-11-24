class WeatherController < ApplicationController
  
  def now
    set_headers()
    lat = params[:lat]
    lon = params[:lon]
    
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon + '&APPID=f2d49b76e1e32ad0cecc11ea796779dc')
    
    model = Weather.create(
      coord: response["coord"],
      country: response["sys"]["country"],
      sunrise: response["sys"]["sunrise"],
      sunset: response["sys"]["sunset"],
      weather: response["weather"],
      temp: response["main"]["temp"],
      humidity: response["main"]["humidity"],
      pressure: response["main"]["pressure"],
      city: response["name"],
      cod: response["cod"]
      )
    
    render :json => model
    
  end
  
  def all
    set_headers()
    render :json => Weather.all
  end
  
  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
