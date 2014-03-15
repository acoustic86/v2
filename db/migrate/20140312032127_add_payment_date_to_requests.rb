class AddPaymentDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :payment_date, :date
  end
end
