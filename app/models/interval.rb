class Interval < ApplicationRecord
  has_many :schedule

  class << self
    def list_intervals ids
      ids.blank? ? Interval.all.pluck(:id) : ids
    end
  end
end
