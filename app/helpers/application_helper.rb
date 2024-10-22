module ApplicationHelper
  def active_link?(params, resource)
    if params[:action] == "index"
      resource == resource.class.first && "active"
    else
      resource == resource.class.find(params[:id]) && "active"
    end
  end
end
