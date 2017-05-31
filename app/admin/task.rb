ActiveAdmin.register Task do
  permit_params :name, :description, :status
end
