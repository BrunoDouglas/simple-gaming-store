ActiveAdmin.register Customer do
  permit_params :credential_id, :address_id, :name, :age, :phone
end
