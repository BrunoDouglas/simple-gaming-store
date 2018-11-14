ActiveAdmin.register Order do
  permit_params :customer_id, :status_id, :order_date, items_attributes: [:id, :order_id, :game_id, :price, :quantity,  :pst, :gst, :hst, :_destroy]

  index do
    selectable_column
    column :id
    column :status
    column :customer
    column :order_date
    column :items do |order|
      order.items.map { |o| o.game.name }.join (", ")
    end

    column 'Total' do |order|
      "C$ " + order.items.map { |o| o.price + (o.price * o.gst + o.pst) }.sum().round(2).to_s
    end
    actions
  end

  show do |order|
    attributes_table do
      row :customer
      row :status
      row :order_date
      row :items do |order|
        order.items.map { |o| o.game.name }.join (", ")
      end
      row 'Total' do |order|
        "C$ " + order.items.map { |o| o.price + (o.price * o.gst + o.pst) }.sum().round(2).to_s
      end
    end

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Order' do
      f.input :customer
      f.input :status
      f.input :order_date

      f.has_many :items, allow_destroy: true do |n_f|
        n_f.input :game
        n_f.input :price
        n_f.input :quantity
        n_f.input :pst
        n_f.input :gst
        n_f.input :hst
      end
    end

    f.actions
  end
end
