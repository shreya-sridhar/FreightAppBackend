class Ride < ApplicationRecord
    belongs_to :driver, class_name: "User"
    belongs_to :customer, class_name: "User"
    has_many :items
end
