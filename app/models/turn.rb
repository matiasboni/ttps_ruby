class Turn < ApplicationRecord
    belongs_to :staff , class_name: "User"
    belongs_to :client ,class_name: "User"
    belongs_to :subsidiary 

    validates :date , presence:{message: "La fecha no puede ser blanco."}
    validates :date , comparison:{greater_than: DateTime.current , message: "La fecha y hora de solicitud debe ser futura."}
    validates :motive , presence:{message: "Debe dar un motivo de la solicitud."}
    validates :subsidiary , presence:{message: "Debe seleccionar una sucursal."}
    validates :client , presence:{message: "Debe tener asociado un cliente."}
    validates :result , presence:{message: "Debe dar un resultado al turno."} , if: :is_attend_action?
    validate :is_in_range?, if: :is_not_nil?

    def is_in_range?
        array=subsidiary.bussiness_hours.map{|s| [s.day,s.opening_time.to_time.strftime("%H:%M"),s.closing_time.to_time.strftime("%H:%M")] }
        ok=array.any? do |b|
            date.to_date.wday == b[0] && date.to_time.strftime("%H:%M").between?(b[1],b[2])
        end
        if not ok
            errors.add(:subsidiary, "La sucursal "+subsidiary.name + " no atiende en ese día y horario.")
        end
    end

    def is_not_nil?
        self.subsidiary!=nil && self.date != nil
    end

    def is_attend_action?
        self.state == true  
    end


end
