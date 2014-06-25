class PortfolioPlatform < ActiveRecord::Base
  has_many :portfolio_entries

  validates :title, presence: true
end
