class Weather
  include Mongoid::Document
  field :coord
  field :country
  field :sunrise
  field :sunset
  field :weather
  field :temp
  field :humidity
  field :pressure
  field :city
  field :cod
end