class AddProjectImageToPortfolioEntries < ActiveRecord::Migration
  def self.up
    add_attachment :portfolio_entries, :project_image
  end

  def self.down
    remove_attachment :portfolio_entries, :project_image
  end
end
