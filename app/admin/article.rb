ActiveAdmin.register Article do

  permit_params :title, :subtitle, :header, :body, :stamp

end
