class PortfolioController < ApplicationController
  def index
    @title = 'Portfolio'
    @platforms = PortfolioPlatform.all
  end
end
