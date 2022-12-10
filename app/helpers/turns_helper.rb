module TurnsHelper

    def convert(state)
        states={false=> "Pendiente",true=> "Atendido"}
        states[state]
    end

    def convert_time(date)
        date.strftime("%H:%M")
    end

end
