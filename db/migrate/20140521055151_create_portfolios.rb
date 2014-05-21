class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title_en
      t.string :title_fa
      t.string :description_en
      t.string :description_fa
      t.date :date
      t.integer :service_id
      t.string :website

      t.timestamps
    end
  end
end
