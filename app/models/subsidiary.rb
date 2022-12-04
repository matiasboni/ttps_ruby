class Subsidiary < ApplicationRecord
    has_many :bussiness_hours
    has_many :turns
    has_many :staffs,class_name: "User" 
end
