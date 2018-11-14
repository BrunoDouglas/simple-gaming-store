ActiveAdmin.register Game do
  permit_params :name, :platform_id, :price, :image, :description, :created_at, :updated_at
end
