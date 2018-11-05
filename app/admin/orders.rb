ActiveAdmin.register Order do
  permit_params :customer_id, :status_id, :order_date
end
