class AddSortOrderToPortfolioEntries < ActiveRecord::Migration
  change_table :portfolio_entries do |t|
    t.integer :sortOrder
  end
end
