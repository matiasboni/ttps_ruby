class Subsidiary < ApplicationRecord
    has_and_belongs_to_many :bussiness_hours
    accepts_nested_attributes_for :bussiness_hours, allow_destroy: true
    has_many :turns
    has_many :staffs,class_name: "User"
    before_destroy :can_delete?

    #Validaciones.
    validates :name,length:{ in: 1..40 ,message:"El nombre debe tener entre 1 y 40 carácteres"},
    uniqueness: {message: "El nombre ingresado ya existe.",case_sensitive: false}
    validates :address ,length:{ in: 1..40 ,message:"La dirección debe tener entre 1 y 40 carácteres"}
    validates :phone_number , length:{ in: 6..18 ,message:"El teléfono debe tener entre 6 y 18 carácteres"},
    numericality: {only_integer:true,message: "El número de teléfono solo admite números."}
    validates :bussiness_hours ,presence:{message:"Debe crear una sucursal con un horario de atención."}

    private
    def can_delete?
        if ! self.turns.empty?
            errors.add(:turns, "No se puede eliminar una sucursal con turnos pendientes o atendidos.")
            false
            throw(:abort)
        elsif ! self.staffs.empty?
            errors.add(:turns, "No se puede eliminar una sucursal con personal asignado.")
            false
            throw(:abort)
        else
            true
        end
    end
end
