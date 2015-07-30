class AddCopyToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :copy, :boolean
  end
end
