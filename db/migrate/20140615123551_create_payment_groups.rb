class CreatePaymentGroups < ActiveRecord::Migration
  def change
    create_table :payment_groups do |t|
      t.string :title

      t.timestamps
    end
  end
end
