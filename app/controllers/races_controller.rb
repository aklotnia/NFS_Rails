class RacesController < ApplicationController
    def new
        user = User.find_by_id(current_user.id)
        if !user.cars.any?
            flash[:errors] = "You haven't created any cars"
            redirect_to user_path(user)
        end
        @cars = user.cars
       
        @locations = Location.all
    end

    def create
        # byebug
        # result calculation
        race = Race.new(strong_params)
        
        race.win = race.comparison(race.car, race.location.car)
        
        if race.win
            current_user.update(cash: current_user.cash + 2000)
        end

        race.save
        redirect_to race_path(race)

    end

    def show
        @race = Race.find(params[:id])
    end

    def results
        
        @race = Race.find(params[:id])

        #byebug
    end

    def new_pink
        user = User.find_by_id(current_user.id)
        if !user.cars.any?
            flash[:errors] = "You haven't created any cars"
            redirect_to user_path(user)
        end
        @cars = user.cars
       
        @locations = Location.all
    end

    def create_pink
        race = Race.new(strong_params)
        
        race.win = race.comparison(race.car, race.location.car)
        

        race.save
        redirect_to race_pink_path(race)
    end

    def show_pink
        @race = Race.find(params[:id])
    end

    def results_pink
        @race = Race.find(params[:id])
        if @race.win
            stock_car = @race.location.car
            Car.create(name: "#{current_user.username}'s #{stock_car.name}", color: stock_car.color, shell_id: stock_car.shell_id, engine_id: stock_car.engine_id, tire_id: stock_car.tire_id, user_id: current_user.id)
        else
            Car.find(@race.car_id).destroy
        end
    end


    
    
    private

    def strong_params
        params.require(:race).permit(:car_id, :location_id)
    end

    

end