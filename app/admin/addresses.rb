ActiveAdmin.register Address do
  permit_params :line1, :postal_code, :city, :province_id
end
