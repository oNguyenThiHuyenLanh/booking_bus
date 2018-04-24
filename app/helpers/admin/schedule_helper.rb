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
end
