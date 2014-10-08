class AddNumberOfIntToFactorDetail < ActiveRecord::Migration
  def change
    add_column :factor_details, :number_of, :integer
  end
end
