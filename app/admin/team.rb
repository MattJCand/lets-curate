ActiveAdmin.register Team do
  index do
    selectable_column
    column :id
    column :description
    column :title
    column :total_members
    column :theme
    column :art_types
    column :budget
    column :date
    column :location
    actions
  end

  permit_params :description, :title, :total_members, :theme, :art_types, :budget, :date, :location
end
