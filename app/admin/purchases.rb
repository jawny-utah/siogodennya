ActiveAdmin.register Purchase do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :city, :np_post_office, :phone_number, :full_name, :comment, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:city, :np_post_office, :phone_number, :full_name, :comment, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :created_at

  show do
    attributes_table do
      row :city
      row :check do |ad|
        image_tag url_for(ad.check), style: "max-height: 600px;"
      end
      row :np_post_office
      row :phone_number
      row :full_name
      row :comment
      row :product
      row :created_at
    end
  end
end
