module TurnsHelper

    def convert(state)
        states={false=> "Pendiente",true=> "Atendido"}
        states[state]
    end

    def convert_time(date)
        date.strftime("%H:%M")
    end

    def can_attend?(turn)
        if turn.date.to_date == Date.today
            array=turn.subsidiary.bussiness_hours.map{|s| [s.day,s.opening_time.to_time.strftime("%H:%M"),s.closing_time.to_time.strftime("%H:%M")] }
            ok=array.any? do |b|
                turn_day_int=turn.date.to_date.wday
                turn_day_int == Date.today.wday && turn_day_int == b[0] && Time.current.strftime("%H:%M").between?(b[1],b[2])
            end
            ok
        else
            false
        end
    end
    
end
