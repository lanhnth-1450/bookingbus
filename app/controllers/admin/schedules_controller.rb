module Admin
  class SchedulesController < BaseController
    include ScheduleHelper

    before_action :filter
    before_action :find_schedule, only: %i(show)

    def index
      @support = Supports::ManageSchedulesSupport.new

      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      if params[:route_id]
        list_pick
      else
        @support = Supports::ManageSchedulesSupport.new
      end
    end

    def show
    end

    def create
      @schedule = Schedule.new(schedule_params)
      if schedule.save
        flash[:success] = t "admin.success.create_success"
        redirect_to admin_schedules_path
      else
        render :new
      end
    end

    private

    attr_reader :road_ids, :schedule

    def list_pick
      find_route
      data = {
        origin_pick: PickAddress.list_pick_add(route.origin_id),
        destination_pick: PickAddress.list_pick_add(route.destination_id)
      }

      render json: data
    end

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

    def schedule_params
      params.require(:schedule).permit Schedule::ATTR
    end
  end
end
