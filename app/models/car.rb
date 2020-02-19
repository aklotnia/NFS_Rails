class Car < ApplicationRecord
    belongs_to :user
    belongs_to :engine
    belongs_to :tire
    belongs_to :shell
    has_many :locations
    
    has_many :races
    validates :name, uniqueness: true

    def average_acceleration
        if ((self.tire.acceleration * 1.5 + self.shell.acceleration + self.engine.acceleration) / 3.0).round(2) > 10
            10.0
        else
            ((self.tire.acceleration * 1.5 + self.shell.acceleration + self.engine.acceleration) / 3.0).round(2)
        end
    end

    def average_speed
        if ((self.tire.speed * 1.5 + self.shell.speed + self.engine.speed) / 3.0).round(2) > 10
            10.0
        else
            ((self.tire.speed * 1.5 + self.shell.speed + self.engine.speed) / 3.0).round(2)
        end
    end

    def average_handling
        if ((self.tire.handling * 1.5 + self.shell.handling + self.engine.handling) / 3.0).round(2) > 10
            10.0
        else
            ((self.tire.handling * 1.5 + self.shell.handling + self.engine.handling) / 3.0).round(2)
        end
    end

    def average_reliability
        ((self.tire.reliability + self.shell.reliability + self.engine.reliability) / 3.0).round(2)
    end
end
