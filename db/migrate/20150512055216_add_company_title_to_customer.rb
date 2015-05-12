class AddCompanyTitleToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :company_title, :string
  end
end
