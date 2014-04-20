class AddTypeToDesignSample < ActiveRecord::Migration
  def change
    add_column :design_samples, :type, :integer
  end
end
