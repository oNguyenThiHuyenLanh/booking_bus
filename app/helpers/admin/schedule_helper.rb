module Admin::ScheduleHelper
  def list_items type_items
    @types = type_items
    @types.map{|type_item| [type_item.name, type_item.id]}
  end
end
