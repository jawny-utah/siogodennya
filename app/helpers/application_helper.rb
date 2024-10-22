module ApplicationHelper
  def active_link?(params, resource)
    if params[:action] == "index"
      resource == resource.class.active.first && "active"
    else
      resource == resource.class.active.find_by(id: params[:id]) && "active"
    end
  end
end
