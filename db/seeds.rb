#Creación horarios.
h1=BussinessHour.create(day:1,opening_time:DateTime.parse("2000-01-01 13:00 "),closing_time:DateTime.parse("2000-01-01 17:00 "))
h2=BussinessHour.create(day:2,opening_time:DateTime.parse("2000-01-01 10:00 "),closing_time:DateTime.parse("2000-01-01 16:00 "))
h3=BussinessHour.create(day:3,opening_time:DateTime.parse("2000-01-01 17:00 "),closing_time:DateTime.parse("2000-01-01 22:00 "))
h4=BussinessHour.create(day:4,opening_time:DateTime.parse("2000-01-01 10:00 "),closing_time:DateTime.parse("2000-01-01 16:00 "))
h5=BussinessHour.create(day:5,opening_time:DateTime.parse("2000-01-01 13:00 "),closing_time:DateTime.parse("2000-01-01 17:00 "))
h6=BussinessHour.create(day:1,opening_time:DateTime.parse("2000-01-01 16:00 "),closing_time:DateTime.parse("2000-01-01 20:00 "))
h7=BussinessHour.create(day:2,opening_time:DateTime.parse("2000-01-01 14:00 "),closing_time:DateTime.parse("2000-01-01 17:00 "))
h8=BussinessHour.create(day:5,opening_time:DateTime.parse("2000-01-01 08:00 "),closing_time:DateTime.parse("2000-01-01 14:00 "))


#Creación sucursales.
(1..8).each do |i|
    s=Subsidiary.new(name:"Sucursal"+i.to_s,address:"Calle "+ i.to_s,phone_number:"15000111"+i.to_s)
    if i % 2 == 0
        s.bussiness_hours.push(h2,h4,h6,h8)
    else
        s.bussiness_hours.push(h1,h3,h5,h7)
    end
    s.save
end

#Creación admins
User.create(email:"admin@gmail.com",password:"123456",role:0)
(1..4).each do |i|
    User.create(email:"admin"+i.to_s+"@gmail.com",password:"123456",role:0)
end

#Creación usuarios
User.create(email:"usuario@gmail.com",password:"123456",role:2)
(1..4).each do |i|
    User.create(email:"usuario"+i.to_s+"@gmail.com",password:"123456",role:2)
end

#Creación personal bancario.
User.create(email:"personal@gmail.com",password:"123456",role:1,subsidiary_id:1)
(1..10).each do |i|
    if i <= 2
        User.create(email:"personal"+i.to_s+"@gmail.com",password:"123456",role:1,subsidiary_id:1)
    elsif i <=4 
        User.create(email:"personal"+i.to_s+"@gmail.com",password:"123456",role:1,subsidiary_id:2)
    elsif i <=6
        User.create(email:"personal"+i.to_s+"@gmail.com",password:"123456",role:1,subsidiary_id:3)
    elsif i <=8
        User.create(email:"personal"+i.to_s+"@gmail.com",password:"123456",role:1,subsidiary_id:4)
    else
        User.create(email:"personal"+i.to_s+"@gmail.com",password:"123456",role:1,subsidiary_id:5)
    end
end


#Creación turnos
Turn.create(date:DateTime.parse("2022-12-12 14:00"),motive:"Motivo1",state:false,client_id:6,subsidiary_id:1)
Turn.create(date:DateTime.parse("2022-12-14 18:00"),motive:"Motivo2",state:false,client_id:6,subsidiary_id:1)
Turn.create(date:DateTime.parse("2022-12-15 11:30"),motive:"Motivo3",state:false,client_id:6,subsidiary_id:2)
Turn.create(date:DateTime.parse("2022-12-15 14:30"),motive:"Motivo4",state:false,client_id:7,subsidiary_id:2)
Turn.create(date:DateTime.parse("2022-12-05 18:45"),motive:"Motivo5",state:true,client_id:7,staff_id:3,subsidiary_id:2,result:"Resultado")




    
