ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Latest Orders" do
          ul do
            Order.last(5).map do |order|
              li link_to("# #{order.id} - Customer: #{order.customer.name} - Items: #{order.items.count}", admin_order_path(order))
            end
          end
        end
    end

    column do
      panel "Latest Customers" do
        ul do
          Customer.last(5).map do |cust|
            li link_to("# #{cust.id} - #{cust.name}", admin_customer_path(cust))
          end
        end
      end
    end
    end
  end # content
end
