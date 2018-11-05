ActiveAdmin.register Order do
  permit_params :customer_id, :status_id, :order_date

  def total
    self.items.map { x += x.price * x.quantity}
  end
end
