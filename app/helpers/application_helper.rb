module ApplicationHelper
  def active_link?(params, resource)
    if params[:action] == "index"
      resource == resource.class.active.first && "active"
    else
      resource == resource.class.active.find_by(id: params[:id]) && "active"
    end
  end

  def page_title(title)
    if title.blank?
      "сьогодення"
    else
      title + " | сьогодення"
    end
  end

  def hide_for_mobile(params)
    params[:id].present? && "hide-for-mobile"
  end
end
