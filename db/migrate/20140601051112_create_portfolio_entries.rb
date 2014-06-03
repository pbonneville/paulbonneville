class CreatePortfolioEntries < ActiveRecord::Migration
  def change
    create_table :portfolio_entries do |t|
      t.string :title
      t.integer :portfolio_platform_id
      t.string :role
      t.text :overview

      t.timestamps
    end
  end
end
