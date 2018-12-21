puts "Seeds TypeOfSeat"
TypeOfSeat.create!(name: "normal",
  bonus_price: 60000,
  created_at: Time.zone.now,
  updated_at: Time.zone.now)

TypeOfSeat.create!(name: "VIP",
  bonus_price: 90000,
  created_at: Time.zone.now,
  updated_at: Time.zone.now)

puts "Seeds Road"
Road.create!(name: "Quốc lộ 1")
Road.create!(name: "Đường Hồ Chí Minh")
Road.create!(name: "Đường sắt Việt Nam")

puts "Seeds Address"
Address.create!(city: "Hà Nội")
Address.create!(city: "Nghệ An")
Address.create!(city: "Thái Nguyên")
Address.create!(city: "Hải Phòng")
Address.create!(city: "Thanh Hóa")
Address.create!(city: "Đà Nẵng")

puts "Seeds PickAddress"
PickAddress.create!(name: "BX Yên Nghĩa",
   address_id: 1)
PickAddress.create!(name: "BX Nước Ngầm",
   address_id: 1)
PickAddress.create!(name: "BX Hà Đông",
   address_id: 1)
PickAddress.create!(name: "100 Nguyễn Xiển",
   address_id: 1)
PickAddress.create!(name: "BX Vinh",
   address_id: 2)
PickAddress.create!(name: "BX Cửa Lò",
   address_id: 2)
PickAddress.create!(name: "BX Thái Nguyên",
   address_id: 3)
PickAddress.create!(name: "Cầu Ca",
   address_id: 3)
PickAddress.create!(name: "Thị trấn Thắng",
   address_id: 3)
PickAddress.create!(name: "BX Cầu Rào",
   address_id: 4)
PickAddress.create!(name: "BX Niệm Nghĩa",
   address_id: 4)
PickAddress.create!(name: "Bến xe phía Bắc Thanh Hóa",
   address_id: 5)
PickAddress.create!(name: "BX Đà Nẵng",
   address_id: 6)

puts "Seeds Route"
Address.all.each do |origin|
  (Address.all - [origin]).each do |destination|
    Route.create!(
      origin_id: origin.id,
      destination_id: destination.id,
      road_id: Road.all.sample.id
    )
  end
end

puts "Seeds Interval"
Interval.create!(name: "Sáng (0h-12h)")
Interval.create!(name: "Chiều (12h-19h)")
Interval.create!(name: "Tối (19h-0h)")

puts "Seeds User"
User.create!(phone_number: "0989390159",
  email: "nguyen.tuan.anhd@framgia.com",
  password: "123456",
  admin: 1,
  role: :admin)

User.create!(phone_number: "0902228931",
  email: "nguyen.thi.huyen.lanh@framgia.com",
  password: "123456",
  admin: 1,
  role: :admin)

User.create!(phone_number: "0965273896",
  email: "tran.manh.hong@framgia.com",
  password: "123456",
  admin: 0,
  role: :manager)

User.create!(phone_number: "0944854132",
  email: "customer@framgia.com",
  password: "123456",
  admin: 0,
  role: :customer)

puts "Seeds ModelBus"
ModelBus.create!(amount_of_seats: 40,
  number_of_floors: 1,
  number_of_rows: 8,
  number_of_columns: 6)
ModelBus.create!(amount_of_seats: 40,
  number_of_floors: 1,
  number_of_rows: 10,
  number_of_columns: 6)
ModelBus.create!(amount_of_seats: 50,
  number_of_floors: 2,
  number_of_rows: 7,
  number_of_columns: 6)

puts "Seeds ActiveSeatCoordinate"
ActiveSeatCoordinate.create!(column: 3,
  row: 1,
  number: 1,
  model_bus_id: 1,
  type_of_seat_id: 2,
  floor: 1)

ActiveSeatCoordinate.create!(column: 4,
  row: 1,
  number: 2,
  model_bus_id: 1,
  type_of_seat_id: 2,
  floor: 1)

number = 2
row = 1
2.times do
  row = row + 1
  4.times do |m|
    column = m+2
    number = number + 1
    ActiveSeatCoordinate.create!(column: column,
      row: row,
      number: number,
      model_bus_id: 1,
      type_of_seat_id: 2,
      floor: 1)
  end
end

5.times do
  row = row + 1
  6.times do |m|
    column = m+1
    number = number + 1
    ActiveSeatCoordinate.create!(column: column,
      row: row,
      number: number,
      model_bus_id: 1,
      type_of_seat_id: 1,
      floor: 1)
  end
end

number = 0
(2..10).each do |row|
  if row < 9
    (1..6).each do |col|
      if col!=3 && col!=4
        number = number + 1
        ActiveSeatCoordinate.create!(column: col,
          row: row,
          number: number,
          model_bus_id: 2,
          type_of_seat_id: 1,
          floor: 1)
      end
    end
  else
    (1..6).each do |col|
      number = number + 1
      ActiveSeatCoordinate.create!(column: col,
        row: row,
        number: number,
        model_bus_id: 2,
        type_of_seat_id: 1,
        floor: 1)
    end
  end
end

number = 0
(2..7).each do |row|
  (1..6).each do |col|
    if col != 3 && col != 4
      number = number + 1
      ActiveSeatCoordinate.create!(column: col,
        row: row,
        number: number,
        model_bus_id: 3,
        type_of_seat_id: 1,
        floor: 1)
    end
  end
end

(1..6).each do |row|
  if row == 1
    (1..6).each do |col|
      number = number + 1
      ActiveSeatCoordinate.create!(column: col,
        row: row,
        number: number,
        model_bus_id: 3,
        type_of_seat_id: 1,
        floor: 2)
    end
  else
    (1..6).each do |col|
      if col!=3 && col!=4
        number = number + 1
        ActiveSeatCoordinate.create!(column: col,
          row: row,
          number: number,
          model_bus_id: 3,
          type_of_seat_id: 1,
          floor: 2)
      end
    end
  end
end

puts "Seeds Bus"
ModelBus.all.each do |model_bus|
  (1..10).each do |n|
    Bus.create!(
      name: "Xe khách #{model_bus.amount_of_seats} chỗ - Mô hình #{model_bus.id} - Số #{n}",
      number_of_seats: model_bus.amount_of_seats,
      model_bus_id: model_bus.id
    )
  end
end

puts "Seeds Schedule"
Route.all.each do |route|
  50.times do |day|
    (1..3).each do |hour|
      origin = route.origin
      destination = route.destination
      Schedule.create!(
        price: rand(100..300)*1000,
        date: Date.today() + day,
        time_start: "#{hour*7}:#{rand(0..59)}",
        time_spent: rand(100..400),
        bus_id: Bus.all.sample.id,
        route_id: route.id,
        interval_id: hour,
        start_station_id: (start_station_id = origin.pick_addresses.sample.id),
        final_station_id: (final_station_id = destination.pick_addresses.sample.id)
      )
    end
  end
end

# puts "Seeds Bill"
# Schedule.all.each do |schedule|
#   numbers_of_ticket = rand(1..3)
#   Bill.create!(
#     total_price: numbers_of_ticket * schedule.price,
#     total_ticket: numbers_of_ticket,
#     schedule_id: schedule.id,
#     user_id: User.all.sample.id
#   )
# end

# puts "Seeds BookedSeat"
# Bill.all.each do |bill|
#   (1..bill.total_ticket).each do |m|
#     BookedSeat.create!(
#       no_of_seat: m,
#       bill_id: bill.id
#     )
#   end
# end

