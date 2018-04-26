module Admin::HomeHelper
  def dropdown_link tagi, title, name
    target = "#" + title
    link_to "#", class: "#{name}", data: {toggle: "collapse", target: target} do
      "<i class='#{tagi}'></i> ".html_safe +
        t("admin.sidebar.#{title}") + "<span class='fa arrow'></span>".html_safe
    end
  end
end
