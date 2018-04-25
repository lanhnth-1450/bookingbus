module Admin::ScheduleHelper
  def list_items type_items
    @types = type_items
    @types.map{|type_item| [type_item.name, type_item.id]}
  end

  def time_end schedule
    @schel = schedule
    (@schel.time_start.in_time_zone + @schel.time_spent * 60).strftime("%H:%M")
  end

  def status_schedule schedule
    @schedule = schedule
    @schedule.date == Date.current ? t("admin.stt.now") : t("admin.stt.will_do")
  end

  def collapse_booked name, target
    link_to "#", class: "#{name}", data: {toggle: "collapse", target: target} do
      "<i class='glyphicon glyphicon-list-alt'></i>".html_safe +
        t("admin.schedule.show.detail_seated")
    end
  end
end
