class AddBackgroundColorToPortfolioEntries < ActiveRecord::Migration
  def change
    add_column :portfolio_entries, :backgroundColor, :string
  end
end
