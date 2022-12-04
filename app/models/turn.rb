class Turn < ApplicationRecord
    belongs_to :staff , class_name: "User"
    belongs_to :client ,class_name: "User"
    belongs_to :subsidiary 

end
