ActiveAdmin.register Game do
  permit_params :name, :platform_id, :price, :image
end
