class PortfolioController < ApplicationController
  def index
    # @portfolio_form = PortfolioForm.new
    init_conditions
  end

  def show
  end

  private

  def init_conditions
    # @tech_categories = TechCategory.includes(:tech_tags).order(:display_order)
    @counts = [[5, 5], [10, 10], [30, 30], ["全て", -1]]
  end
end
