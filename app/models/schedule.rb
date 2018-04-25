class Schedule < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  belongs_to :start, foreign_key: "start_station_id",
    class_name: PickAddress.name
  belongs_to :final, foreign_key: "final_station_id",
    class_name: PickAddress.name

  delegate :model_bus, to: :bus, prefix: false

  has_many :bills

  def booked_seats
    Schedule.joins(bills: :booked_seats).where(id: id).pluck(:no_of_seat)
  end

  def empty_slot
    bus.model_bus.amount_of_seats - booked_seats.count
  end

  def price_seat no_of_seat
    Schedule.joins(bus: {model_bus: {active_seat_coordinates: :type_of_seat}})
      .where("schedules.id = ?", id)
      .where("active_seat_coordinates.number = ?", no_of_seat)
      .pluck(:bonus_price).first + price
  end

  def type_of_seat no_of_seat
    Schedule.joins(bus: {model_bus: {active_seat_coordinates: :type_of_seat}})
      .where("schedules.id = ?", id)
      .where("active_seat_coordinates.number = ?", no_of_seat)
      .pluck("type_of_seats.name").first
  end

  def origin_address
    Address.joins(routes_start: :schedules).where("schedules.id = ?", id)
      .distinct.pluck(:city).first
  end

  def destination_address
    Address.joins(routes_final: :schedules).where("schedules.id = ?", id)
      .distinct.pluck(:city).first
  end

  class << self
    def find_schedules route_ids, date, interval_id
      schedules = Schedule.where route_id: route_ids, date: date,
        interval_id: interval_id
      schedules.to_a
    end

    def filter_schedules r_ids, i_ids
      Schedule.where route_id: r_ids, interval_id: i_ids
    end
  end
end
