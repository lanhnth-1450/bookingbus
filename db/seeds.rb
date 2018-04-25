TypeOfSeat.create!(name: "normal",
  bonus_price: 60000,
  created_at: Time.zone.now,
  updated_at: Time.zone.now)

TypeOfSeat.create!(name: "VIP",
  bonus_price: 90000,
  created_at: Time.zone.now,
  updated_at: Time.zone.now)

Road.create!(name: "Quốc lộ 1")
Road.create!(name: "Đường Hồ Chí Minh")
Road.create!(name: "Đường sắt Việt Nam")


Address.create!(city: "Hà Nội")
Address.create!(city: "Nghệ An")
Address.create!(city: "Thái Nguyên")
Address.create!(city: "Hải Phòng")
Address.create!(city: "Thanh Hóa")
Address.create!(city: "Đà Nẵng")

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

Route.create!(origin_id: 1,
  destination_id: 2,
  road_id: 1)

Route.create!(origin_id: 2,
  destination_id: 1,
  road_id: 1)

Route.create!(origin_id: 3,
  destination_id: 2,
  road_id: 2)

Route.create!(origin_id: 2,
  destination_id: 3,
  road_id: 2)

Route.create!(origin_id: 1,
  destination_id: 3,
  road_id: 1)

Route.create!(origin_id: 3,
  destination_id: 1,
  road_id: 1)

Route.create!(origin_id: 1,
  destination_id: 4,
  road_id: 1)

Route.create!(origin_id: 4,
  destination_id: 1,
  road_id: 1)

Route.create!(origin_id: 1,
  destination_id: 5,
  road_id: 1)

Route.create!(origin_id: 5,
  destination_id: 1,
  road_id: 1)

Route.create!(origin_id: 1,
  destination_id: 6,
  road_id: 2)

Route.create!(origin_id: 6,
  destination_id: 1,
  road_id: 2)

# Ha Noi -> Nghe An
# diem don tai HN
RoutePickAddress.create!(route_id: 1,
  pick_address_id: 1,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 1,
  pick_address_id: 2,
  time_from_address: 30)

# diem tra tai Nghe An
RoutePickAddress.create!(route_id: 1,
  pick_address_id: 5,
  time_from_address: 30)

RoutePickAddress.create!(route_id: 1,
  pick_address_id: 6,
  time_from_address: 0)

# Nghe An -> Ha Noi
# diem don tai Nghe An
RoutePickAddress.create!(route_id: 2,
  pick_address_id: 6,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 2,
  pick_address_id: 5,
  time_from_address: 30)
#  diem tra tai HN
RoutePickAddress.create!(route_id: 2,
  pick_address_id: 2,
  time_from_address: 30)

RoutePickAddress.create!(route_id: 2,
  pick_address_id: 1,
  time_from_address: 0)

# Ha Noi -> Thai Nguyen
# diem don tai HN
RoutePickAddress.create!(route_id: 5,
  pick_address_id: 1,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 5,
  pick_address_id: 2,
  time_from_address: 30)
# diem tra tai Thai Nguyen
RoutePickAddress.create!(route_id: 5,
  pick_address_id: 7,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 5,
  pick_address_id: 8,
  time_from_address: 30)

RoutePickAddress.create!(route_id: 5,
  pick_address_id: 9,
  time_from_address: 50)

# Thai Nguyen -> Ha Noi
# diem tra tai HN
RoutePickAddress.create!(route_id: 6,
  pick_address_id: 1,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 6,
  pick_address_id: 2,
  time_from_address: 30)
# diem don tai Thai Nguyen
RoutePickAddress.create!(route_id: 6,
  pick_address_id: 7,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 6,
  pick_address_id: 8,
  time_from_address: 30)

RoutePickAddress.create!(route_id: 6,
  pick_address_id: 9,
  time_from_address: 50)

# Ha Noi -> Hai Phong
# diem don tai HN
RoutePickAddress.create!(route_id: 7,
  pick_address_id: 1,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 7,
  pick_address_id: 2,
  time_from_address: 30)
# diem tra Hai Phong
RoutePickAddress.create!(route_id: 7,
  pick_address_id: 10,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 7,
  pick_address_id: 11,
  time_from_address: 30)

# Hai Phong -> HN
# diem tra tai HN
RoutePickAddress.create!(route_id: 8,
  pick_address_id: 1,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 8,
  pick_address_id: 2,
  time_from_address: 30)
# diem don Hai Phong
RoutePickAddress.create!(route_id: 8,
  pick_address_id: 10,
  time_from_address: 0)

RoutePickAddress.create!(route_id: 8,
  pick_address_id: 11,
  time_from_address: 30)

# Ha Noi -> Thanh Hoa
# diem don tai HN
RoutePickAddress.create!(route_id: 9,
  pick_address_id: 1,
  time_from_address: 0)

# diem tra Thanh Hoa
RoutePickAddress.create!(route_id: 9,
  pick_address_id: 12,
  time_from_address: 0)

# Thanh Hoa -> HN
# diem tra tai HN
RoutePickAddress.create!(route_id: 10,
  pick_address_id: 1,
  time_from_address: 0)

# diem don tai Thanh Hoa
RoutePickAddress.create!(route_id: 10,
  pick_address_id: 12,
  time_from_address: 0)

Interval.create!(name: "Sáng (0h-12h)")
Interval.create!(name: "Chiều (12h-19h)")
Interval.create!(name: "Tối (19h")

User.create!(phone_number: "0989390159",
  email: "a1k9lanh@gmail.com",
  password: "anhquan96",
  admin: 1)

User.create!(phone_number: "0902228931",
  email: "lanh123@gmail.com",
  password: "anhquan96",
  admin: 0)

User.create!(phone_number: "0965273896",
  email: "nguyenleanhquan@gmail.com",
  password: "anhquan96",
  admin: 1)

User.create!(phone_number: "0944854132",
  email: "quannla@gmail.com",
  password: "anhquan96",
  admin: 0)

ModelBus.create!(amount_of_seats: 40,
  number_of_floors: 1,
  number_of_rows: 8,
  number_of_columns: 6)
ModelBus.create!(amount_of_seats: 40,
  number_of_floors: 1,
  number_of_rows: 10,
  number_of_columns: 5)
ModelBus.create!(amount_of_seats: 50,
  number_of_floors: 2,
  number_of_rows: 6,
  number_of_columns: 5)

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
2.times do |n|
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

5.times do |n|
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

Bus.create!(name: "Xe khách Daewoo FX12 40 cho",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Xe giuong nam Daewoo BX212DS 40 cho",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Xe Daewoo BC212MA 40 cho",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Thaco Town TB95S 40 cho",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Thaco Town TB82S 40 cho",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Xe khách Hyundai Limostar 5.3 40 chỗ",
  number_of_seats: 40,
  model_bus_id: 1)

Bus.create!(name: "Hyundai Universe Noble 40 chỗ",
  number_of_seats: 40,
  model_bus_id: 1)

Schedule.create!(price: 300000,
  date: Date.parse("15/05/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 1,
  route_id: 1,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 6)

Schedule.create!(price: 300000,
  date: Date.parse("15/05/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 1,
  route_id: 2,
  interval_id: 2,
  start_station_id: 6,
  final_station_id: 1)

Schedule.create!(price: 300000,
  date: Date.parse("05/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 2,
  route_id: 3,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 6)

Schedule.create!(price: 300000,
  date: Date.parse("05/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 2,
  route_id: 4,
  interval_id: 2,
  start_station_id: 6,
  final_station_id: 1)

Schedule.create!(price: 120000,
  date: Date.parse("05/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 4,
  route_id: 5,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 9)

Schedule.create!(price: 120000,
  date: Date.parse("05/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 4,
  route_id: 6,
  interval_id: 2,
  start_station_id: 9,
  final_station_id: 1)

Schedule.create!(price: 160000,
  date: Date.parse("05/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 3,
  route_id: 7,
  interval_id: 1,
  start_station_id: 2,
  final_station_id: 11)

Schedule.create!(price: 160000,
  date: Date.parse("05/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 3,
  route_id: 8,
  interval_id: 2,
  start_station_id: 10,
  final_station_id: 2)

Schedule.create!(price: 160000,
  date: Date.parse("05/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 2,
  route_id: 9,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 12)

Schedule.create!(price: 160000,
  date: Date.parse("06/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 2,
  route_id: 10,
  interval_id: 2,
  start_station_id: 12,
  final_station_id: 1)

Schedule.create!(price: 300000,
  date: Date.parse("06/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 1,
  route_id: 1,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 6)

Schedule.create!(price: 300000,
  date: Date.parse("06/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 1,
  route_id: 2,
  interval_id: 2,
  start_station_id: 6,
  final_station_id: 1)

Schedule.create!(price: 120000,
  date: Date.parse("06/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 4,
  route_id: 5,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 9)

Schedule.create!(price: 120000,
  date: Date.parse("06/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 4,
  route_id: 6,
  interval_id: 2,
  start_station_id: 1,
  final_station_id: 9)

Schedule.create!(price: 160000,
  date: Date.parse("06/10/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 3,
  route_id: 7,
  interval_id: 1,
  start_station_id: 2,
  final_station_id: 11)

Schedule.create!(price: 160000,
  date: Date.parse("06/10/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 3,
  route_id: 8,
  interval_id: 2,
  start_station_id: 10,
  final_station_id: 2)

Schedule.create!(price: 160000,
  date: Date.parse("06/04/2018"),
  time_start: "8:00",
  time_spent: 300,
  bus_id: 2,
  route_id: 9,
  interval_id: 1,
  start_station_id: 1,
  final_station_id: 12)

Schedule.create!(price: 160000,
  date: Date.parse("06/04/2018"),
  time_start: "13:30",
  time_spent: 300,
  bus_id: 2,
  route_id: 10,
  interval_id: 2,
  start_station_id: 12,
  final_station_id: 1)

Bill.create!(total_price: 180000,
  total_ticket: 2,
  user_id: 2,
  schedule_id: 1
  )
  BookedSeat.create!(no_of_seat: 1,
    bill_id: 1)
  BookedSeat.create!(no_of_seat: 5,
    bill_id: 1)

Bill.create!(total_price: 60000,
  total_ticket: 1,
  user_id: 2,
  schedule_id: 1)
  BookedSeat.create!(no_of_seat: 21,
    bill_id: 2)

Bill.create!(total_price: 150000,
  total_ticket: 2,
  user_id: 4,
  schedule_id: 1)
  BookedSeat.create!(no_of_seat: 22,
    bill_id: 3)
  BookedSeat.create!(no_of_seat: 6,
    bill_id: 3)

Bill.create!(total_price: 90000,
  total_ticket: 1,
  user_id: 4,
  schedule_id: 2)
  BookedSeat.create!(no_of_seat: 6,
    bill_id: 4)

Bill.create!(total_price: 180000,
  total_ticket: 2,
  user_id: 4,
  schedule_id: 2)
  BookedSeat.create!(no_of_seat: 7,
    bill_id: 5)
  BookedSeat.create!(no_of_seat: 10,
    bill_id: 5)

Bill.create!(total_price: 180000,
  total_ticket: 3,
  user_id: 4,
  schedule_id: 2)
  BookedSeat.create!(no_of_seat: 11,
    bill_id: 6)
  BookedSeat.create!(no_of_seat: 12,
    bill_id: 6)
  BookedSeat.create!(no_of_seat: 19,
    bill_id: 6)
