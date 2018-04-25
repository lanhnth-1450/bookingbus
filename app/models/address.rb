class Address < ApplicationRecord
  has_many :pick_addresses, dependent: :destroy
  has_many :routes_start, foreign_key: "origin_id", class_name: Route.name
  has_many :routes_final, foreign_key: "destination_id", class_name: Route.name
end
