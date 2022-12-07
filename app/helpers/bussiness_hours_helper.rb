module BussinessHoursHelper
    def days
        [
            {label: "Lunes", value: 1},
            {label: "Martes", value: 2},
            {label: "Miércoles", value: 3},
            {label: "Jueves", value: 4},
            {label: "Viernes", value: 5},
            {label: "Sábado",value: 6},
            {label: "Domingo",value: 7}
        ]
    end

    def day_to_string(day)
        dias={1 => "Lunes",2 => "Martes",3 => "Miercolés",4 => "Jueves",5 => "Viernes",
        6 => "Sábado", 7 => "Domingo"}
        dias[day]
    end
end