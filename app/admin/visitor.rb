ActiveAdmin.register Visitor do

  permit_params :ip, :country, :state, :city, :last_visit_at, :visit_count

end
