class Subsidiary < ApplicationRecord
    has_many :bussiness_hours
    accepts_nested_attributes_for :bussiness_hours, allow_destroy: true
    has_many :turns
    has_many :staffs,class_name: "User"

    validates :name , presence:{message: "El nombre no puede ser blanco"} ,
    uniqueness: {message: "El nombre ingresado ya existe"}
    validates :address ,presence: {message: "La dirección no puede ser blanco"}
    validates :phone_number , presence: {message: "El número de télefono no puede ser blanco"},
    numericality: {only_integer:true,message: "El número de teléfono solo admite números"}
end
