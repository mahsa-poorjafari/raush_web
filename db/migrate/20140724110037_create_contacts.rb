class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :preson_name
      t.string :company_name
      t.string :phone
      t.string :fax
      t.string :address

      t.timestamps
    end
  end
end
