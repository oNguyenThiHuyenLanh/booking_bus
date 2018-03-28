TypeOfSeat.create!(name: "normal",
                   ticket_price: 60000,
                   created_at: Time.zone.now,
                   updated_at: Time.zone.now)

TypeOfSeat.create!(name: "VIP",
                   ticket_price: 90000,
                   created_at: Time.zone.now,
                   updated_at: Time.zone.now)


TypeOfBus.create!(name: "Xe khách Daewoo")

TypeOfBus.create!(name: "Xe khách Thaco")

TypeOfBus.create!(name: "Xe khách Hyundai")


Bus.create!(name: "Xe khách Daewoo FX12 47 cho",
            number_of_seats: 47,
            type_of_bus_id: 1)

Bus.create!(name: "Xe giuong nam Daewoo BX212DS 41 cho",
            number_of_seats: 41,
            type_of_bus_id: 1)

Bus.create!(name: "Xe Daewoo BC212MA 50 cho",
            number_of_seats: 50,
            type_of_bus_id: 1)

Bus.create!(name: "Thaco Town TB95S 39 cho",
            number_of_seats: 39,
            type_of_bus_id: 2)

Bus.create!(name: "Thaco Town TB82S 29 cho",
            number_of_seats: 29,
            type_of_bus_id: 2)

Bus.create!(name: "Xe khách Hyundai Limostar 5.3 29 chỗ",
            number_of_seats: 29,
            type_of_bus_id: 3)

Bus.create!(name: "Hyundai Universe Noble 29 chỗ",
            number_of_seats: 47,
            type_of_bus_id: 3)


10.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 2,
               type_of_bus_id: 1)
end
40.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 1,
               type_of_bus_id: 1)
end

10.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 2,
               type_of_bus_id: 2)
end
30.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 1,
               type_of_bus_id: 2)
end

10.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 2,
               type_of_bus_id: 3)
end
20.times do |n|
  index = "#{n+1}"
  Seat.create!(number: index,
               type_of_seat_id: 1,
               type_of_bus_id: 3)
end


Road.create!(name: "Quốc lộ 1")
Road.create!(name: "Đường Hồ Chí Minh")
Road.create!(name: "Đường sắt Việt Nam")


Address.create!(city: "Ha Noi")
Address.create!(city: "Nghe An")


PickAddress.create!(name: "BX Yen Nghia",
                    time_from_address: 0,
                    address_id: 1)
PickAddress.create!(name: "BX Nuoc Ngam",
                    time_from_address: 30,
                    address_id: 1)

PickAddress.create!(name: "BX Cua Lo",
                    time_from_address: 0,
                    address_id: 2)
PickAddress.create!(name: "BX Ha Tinh",
                    time_from_address: 30,
                    address_id: 2)


Route.create!(origin_id: 1,
              destination_id: 2)

Route.create!(origin_id: 2,
              destination_id: 1)


RoutePickAddress.create!(route_id: 1,
                         pick_address_id: 1)

RoutePickAddress.create!(route_id: 1,
                         pick_address_id: 2)

RoutePickAddress.create!(route_id: 1,
                         pick_address_id: 3)


Schedule.create!(price: 50000,
                 time_start: DateTime.parse("05/10/2018 8:00"),
                 time_spent: 300,
                 road_id: 1,
                 bus_id: 1,
                 route_id: 1)

Schedule.create!(price: 50000,
                 time_start: DateTime.parse("05/10/2018 13:30"),
                 time_spent: 300,
                 road_id: 1,
                 bus_id: 1,
                 route_id: 2)


User.create!(phone_number: "0989390159",
             email: "a1k9lanh@gmail.com",
             admin: 1)

User.create!(phone_number: "0902228931",
             email: "a1k9lp@gmail.com",
             admin: 0)


Bill.create!(total_price: 0,
              total_ticket: 0,
              status: 1,
              user_id: 2)

Bill.create!(total_price: 0,
              total_ticket: 0,
              status: 1,
              user_id: 2)


BookedSeat.create!(no_of_seat: 10,
                   bill_id: 1,
                   schedule_id: 1)

BookedSeat.create!(no_of_seat: 10,
                   bill_id: 1,
                   schedule_id: 2)
