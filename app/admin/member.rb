ActiveAdmin.register Member do
 permit_params :project_owner, :status, :message
end
