class Shell < ApplicationRecord
    has_many :cars

    def full_stats
        "#{self.name}/#{self.shell_type}, (a: #{self.acceleration}, S: #{self.speed}, H: #{self.handling}) PRICE: $#{self.cost}"
    end
end
