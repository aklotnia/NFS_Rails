class Engine < ApplicationRecord
    has_many :cars

    def full_stats
        "#{self.name}/#{self.engine_type}, (a: #{self.acceleration}, S: #{self.speed}, H: #{self.handling}) PRICE: $#{self.cost}"
    end
end