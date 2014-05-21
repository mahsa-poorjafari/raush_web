class CreateOrderOnlines < ActiveRecord::Migration
  def change
    create_table :order_onlines do |t|
      t.string :name
      t.string :phone
      t.string :email      
      t.string :company_name
      t.string :web_site
      t.string :mobile
      t.text :text_msg

      t.timestamps
    end
  end
end
