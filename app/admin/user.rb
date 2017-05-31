ActiveAdmin.register User do
index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :admin
    column :city
    column :art_types
    column :description
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :city
      f.input :art_types
      f.input :description
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :first_name, :last_name, :city, :art_types, :description, :email, :admin

end
