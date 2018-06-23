class Route < ApplicationRecord
  belongs_to :destination, foreign_key: "destination_id",
    class_name: Address.name
  belongs_to :origin, foreign_key: "origin_id", class_name: Address.name
  belongs_to :road

  has_many :schedules
  has_many :pick_addresses, through: :route_pick_addresses
  has_many :bills, through: :schedules

  def name
    origin.city + "-" + destination.city
  end

  class << self
    def find_routes origin_id, destination_id
      Route.where(origin_id: origin_id,
        destination_id: destination_id).pluck :id
    end

    def list_routes ids
      ids.blank? ? Route.all.pluck(:id) : ids
    end
  end
end
