class Road < ApplicationRecord
  has_many :routes

  class << self
    def list_routes ids
      road_ids = ids.blank? ? Road.all.pluck(:id) : ids
      Route.where(road_id: road_ids).pluck(:id)
    end
  end
end
