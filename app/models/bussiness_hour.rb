class BussinessHour < ActiveRecord::Base
    belongs_to :subsidiary

    validates :opening_time ,presence:{message: "La hora de apertura no puede ser blanco"}
    validates :closing_time ,presence:{message: "La hora de cierre no puede ser blanco"}


end
