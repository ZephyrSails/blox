ActiveAdmin.register Article do

  permit_params :title, :subtitle, :header, :body, :stamp, :created_at, :updated_at, :view_count

  form do |f|
    f.inputs "Article" do
      f.input :title
      f.input :subtitle
      f.input :header
      f.input :body
      f.input :stamp
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end

end
