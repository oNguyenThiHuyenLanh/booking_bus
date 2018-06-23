module Admin::StatisticHelper
  def list_items type_items
    @types = type_items
    @types.map{|type_item| [type_item.name, type_item.id]}
  end

  def list_type
    [[t("admin.statistic.by_months"), 1], [t("admin.statistic.by_years"), 2]]
  end
end
