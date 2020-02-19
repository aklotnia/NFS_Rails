require 'open_weather'
class Location < ApplicationRecord
    has_many :races
    belongs_to :car

    def description
        "#{self.name} (#{self.call})" 
    end

    def call
        weather = self.weather
        options = { units: "metric", APPID: API_KEY }
        weather_hash = OpenWeather::Current.city_id("#{self.weather}", options)
        # byebug
        weather_hash["weather"][0]["description"]
    end

    def call_main
        weather = self.weather
        options = { units: "metric", APPID: API_KEY }
        weather_hash = OpenWeather::Current.city_id("#{self.weather}", options)
        # byebug
        weather_hash["weather"][0]["main"]
    end
end