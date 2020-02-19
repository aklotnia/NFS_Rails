class CarsController < ApplicationController
    def new
        @car = Car.new
        @shells = Shell.all
        @engines = Engine.all
        @tires = Tire.all
    end

    def create
        car = Car.new(strong_params)

        car.user_id = current_user.id
        
        price = total_cost(strong_params)
        
        if price <= current_user.cash

            current_user.update(cash: current_user.cash - price)
            
        
            if car.save
                redirect_to car_path(car)
            else
                flash[:errors] = car.errors.full_messages
                redirect_to new_car_path
            end
        else
            flash[:errors] = ["You too broke"]
            redirect_to new_car_path
        end

    end

    def show
        @car = Car.find_by_id(params[:id])
    end

    def delete
        car = Car.find_by_id(params[:id])
        pid = fork{ exec 'afplay', "/Users/Carlos/Development/code/02_Mod_2/NFS-Rails/sounds/KFK.mp3"}
        car.destroy
        current_user.update(cash: current_user.cash + 500)
        sleep 2
        pid = fork{ exec ‘killall’, “afplay”} #not working
        redirect_to user_path(current_user.id)
    end

    def edit
        @car = Car.find_by_id(params[:id])
        @shells = Shell.all
        @engines = Engine.all
        @tires = Tire.all
    end

    def update
        car = Car.find_by_id(params[:id])

        if total_cost(strong_params) >= current_cost(car)
            price = total_cost(strong_params) - current_cost(car)
        else
            price =  0
        end

        if price <= current_user.cash
            current_user.update(cash: current_user.cash - price)
            if car.update(strong_params)
                redirect_to car_path(car)
            else
                flash[:errors] = car.errors.full_messages
                redirect_to edit_car_path
            end

        else
            flash[:errors] = ["You too broke"]
            redirect_to edit_car_path
        end
    end

    def strong_params 
        params.require(:car).permit(:name, :color, :shell_id, :engine_id, :tire_id)
    end

    def current_cost(car)
        car.shell.cost + car.engine.cost + car.tire.cost 
    end

    def total_cost(params)
        Shell.find(params['shell_id']).cost + Engine.find(params['engine_id']).cost + Tire.find(params['tire_id']).cost
    end

end