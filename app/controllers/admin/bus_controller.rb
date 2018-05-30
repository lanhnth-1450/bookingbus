module Admin
  class BusController < BaseController
    include ScheduleHelper

    before_action :load_bus_ids, if: :valid_schedule?, only: [:new]

    def new
      data = Bus.list_bus bus_ids

      render json: data
    end

    private

    attr_reader :bus_ids

    def load_bus_ids
      @bus_ids = []
      ids = Bus.all.pluck(:id)
      date = params[:date].to_date
      schedule = Schedule.order_by_date

      valid_bus ids, schedule, date
    end

    def valid_bus ids, schedule, date
      find_route
      ids.each do |id|
        schedule_first = schedule.find_by(bus_id: id)
        if (schedule_first && rule_route(schedule_first) &&
            rule_date(schedule_first, date)) || !(schedule_first)
          bus_ids.push id
        end
      end
    end

    def rule_date schedule, date
      date_schedule = schedule.date
      (date_schedule < date) || ((date_schedule == date) &&
                                (params[:time] >= time_end(schedule)))
    end

    def rule_route schedule
      schedule.destination.id == route.origin.id
    end

    def valid_schedule?
      time = params[:time].in_time_zone.strftime("%k:%M").strip
      Schedule.find_schedule(params[:route_id], params[:date], time).blank?
    end
  end
end
