ActiveAdmin.register Visitor do

  permit_params :ip, :country, :state, :city, :last_visit_at

  index do
    selectable_column
    id_column
    column :ip
    column :country
    column :state
    column :city
    column :last_visit_at
    column :visit_count
    actions
    # column :data as "status"s
  end

end
