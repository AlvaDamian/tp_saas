class WeatherController < ApplicationController
  
  def now
    lat = params[:lat]
    lon = params[:lon]
    
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?lat=' + lat + '&lon=' + lon)
    render :json => response
  end
end
