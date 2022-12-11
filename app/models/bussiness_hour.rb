class BussinessHour < ActiveRecord::Base
    belongs_to :subsidiary

    #Validaciones
    validates :opening_time ,presence:{message: "La hora de apertura no puede ser blanco"}
    validates :closing_time ,presence:{message: "La hora de cierre no puede ser blanco"}
    validates :opening_time,comparison:{less_than: :closing_time , message: "La hora de apertura debe ser anterior a la de cierre."}
end
