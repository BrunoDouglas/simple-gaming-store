ActiveAdmin.register Item do
  permit_params :order_id, :game_id, :price, :quantity, :tax
end
