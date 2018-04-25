module Admin
  class SchedulesController < BaseController
    before_action :filter
    before_action :find_schedule, only: %i(show)

    def index
      @support = Supports::ManageSchedulesSupport.new

      respond_to do |format|
        format.html
        format.js
      end
    end

    def show
    end

    private

    attr_reader :road_ids, :schedule

    def filter
      p_road_ids = params[:road_ids]
      p_interval_ids = params[:interval_ids]
      @schedules = do_filter(p_road_ids, p_interval_ids) if p_road_ids ||
                                                            p_interval_ids
    end

    def do_filter param_road_ids, param_interval_ids
      @road_ids = param_road_ids
      interval_ids = Interval.list_intervals param_interval_ids
      route_ids = Road.list_routes road_ids
      Schedule.filter_schedules route_ids, interval_ids
    end

    def find_schedule
      @schedule = Schedule.find_by id: params[:id]

      return if schedule
      flash[:danger] = t "admin.error.invalid_schedule"
      redirect_to admin_schedules_path
    end
  end
end
