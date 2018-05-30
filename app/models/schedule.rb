class Schedule < ApplicationRecord
  ATTR = %i(price time_start time_spent bus_id route_id interval_id date
    start_station_id final_station_id)

  belongs_to :bus
  belongs_to :route
  belongs_to :start, foreign_key: "start_station_id",
    class_name: PickAddress.name
  belongs_to :final, foreign_key: "final_station_id",
    class_name: PickAddress.name

  has_one :origin, through: :route
  has_one :destination, through: :route
  has_one :model_bus, through: :bus
  has_many :active_seat_coordinates, through: :model_bus
  has_many :type_of_seat, ->{distinct}, through: :active_seat_coordinates

  has_many :bills
  has_many :booked_seats, through: :bills

  validates :date, presence: true
  validates :time_start, presence: true
  validates :time_spent, presence: true
  validates :start_station_id, presence: true
  validates :final_station_id, presence: true

  scope :order_by_date, ->{order(date: :desc, time_start: :asc)}

  def empty_slot
    model_bus.amount_of_seats - booked_seats.count
  end

  def price_of_seat no_of_seat
    type_of_seat.where("active_seat_coordinates.number = ?", no_of_seat)
      .pluck(:bonus_price).first + price
  end

  def name_type_of_seat no_of_seat
    type_of_seat.where("active_seat_coordinates.number = ?", no_of_seat)
      .pluck("type_of_seats.name").first
  end

  def origin_address
    origin.city
  end

  def destination_address
    destination.city
  end

  def no_of_booked_seat_array
    booked_seats.pluck :no_of_seat
  end

  def seats_existed seats
    list_of_booked_seats = booked_seats.pluck :no_of_seat
    !(list_of_booked_seats - seats == list_of_booked_seats)
  end

  class << self
    def find_schedules route_ids, date, interval_id
      schedules = Schedule.where route_id: route_ids, date: date,
        interval_id: interval_id
      schedules.to_a
    end

    def filter_schedules r_ids, i_ids
      Schedule.where(route_id: r_ids, interval_id: i_ids).order_by_date
    end

    def find_schedule route_ids, date, time
      schedules = Schedule.where route_id: route_ids, date: date,
        time_start: time
      schedules.to_a
    end
  end
end
