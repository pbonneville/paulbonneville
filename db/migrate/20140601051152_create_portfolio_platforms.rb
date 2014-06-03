class CreatePortfolioPlatforms < ActiveRecord::Migration
  def change
    create_table :portfolio_platforms do |t|
      t.string :title
      t.integer :sortOrder

      t.timestamps
    end
  end
end
