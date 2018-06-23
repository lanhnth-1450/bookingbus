module Admin
  class StatisticsController < BaseController
    include StatisticHelper

    def index
      @routes = Route.all
      # byebug
      @data = statistic if params[:route_id] && params[:select_type]
    end

    private

    def statistic
      type = 1
      year = 2018
      route = Route.find 5
      byebug
      if (type == 1) && year
        route.bills.group("month(bills.created_at), year(bills.created_at)").where("year(bills.created_at) = ?", year)
        .pluck("month(bills.created_at), sum(total_price)")
      elsif type == 2
        route.bills.group("year(bills.created_at)").pluck("sum(total_price)")
      end
    end
  end
end
