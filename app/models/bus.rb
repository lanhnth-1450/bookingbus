class Bus < ApplicationRecord
  belongs_to :model_bus
  has_many :schedules

  scope :list_bus, -> (ids){where(id: ids)}
end
