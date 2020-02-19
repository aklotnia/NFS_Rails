class Race < ApplicationRecord
    has_many :carraces
    belongs_to :car
    belongs_to :location

    def result(vehicle)
        overall_average = ((self.car.average_acceleration + self.car.average_speed + self.car.average_handling) / 3.0)
        overall_average * weather_effect(vehicle)
    end

    def comparison(user_car, stock_car)
        user_car_result = result(user_car)
        stock_car_result = result(stock_car)

        user_percentage = user_car_result/(user_car_result + stock_car_result) * 100
        
        percent = rand(1..100)

        if percent <= user_percentage
            1
        else
            0
        end

    
    end


    def weather_type
        current_type = self.location.call_main
        if current_type == 'Thunderstorm' || current_type == 'Drizzle' || current_type == 'Rain' || current_type ==  'Mist' || current_type ==  'Squall' 
            'rain'
        elsif current_type == 'Snow'
            'snow'
        else #'Smoke' || 'Haze' || 'Dust' || 'Fog' || 'Sand' || 'Ash' || 'Tornado' || 'Clear' || 'Clouds'
            'clear'
        end
    
    end


    def weather_effect(vehicle)
        
        weather_tire = 
        {
            'Slicks'=>{ 'clear'=> 1.0, 'rain'=> 0.5, 'snow'=> 0.1},
            'Average'=>{ 'clear'=> 1.0, 'rain'=> 0.8, 'snow'=> 0.3},
            'Snow'=>{ 'clear'=> 1.0, 'rain'=> 0.75, 'snow'=> 0.9},
            'Treads'=>{ 'clear'=> 1.0, 'rain'=> 1.0, 'snow'=> 1.0},
            'Fred Flinstone'=>{ 'clear'=> 1.0, 'rain'=> 1.0, 'snow'=> 1.0},
            'Delorian Hover Craft'=>{ 'clear'=> 1.0, 'rain'=> 1.0, 'snow'=> 1.0}
        }

        weather_tire[vehicle.tire.name][weather_type]  

    end


end