class RemoveNumberOfIntFromFactorDetail < ActiveRecord::Migration
  def change
    remove_column :factor_details, :number_of, :string
  end
end
