module Admin::HomeHelper
  def dropdown_link target, tagi, title
    link_to "#", data: {toggle: "collapse", target: target} do
      "<i class='#{tagi}'></i> ".html_safe +
        t("admin.sidebar.#{title}") +
        "<span class='fa arrow'></span>".html_safe
    end
  end
end
