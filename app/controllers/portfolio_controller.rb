class PortfolioController < ApplicationController
  before_action :init_conditions

  def index
    @portfolio_form = PortfolioForm.new
  end

  def show
    form = params.require(:portfolio_form).permit(:user_id, {tech_tag_ids: {}}, :count)
    @portfolio_form = PortfolioForm.new(form)

    @target_user = User.published.find_by(id: params[:portfolio_form][:user_id]) if @portfolio_form.valid?

    @projects = ProjectDecorator.decorate_collection(@portfolio_form.search)

    render :index
  end

  private

  def init_conditions
    @tech_categories = TechCategory.includes(:tech_tags).top_levels.order(:display_order)
    @users = UserDecorator.decorate_collection(User.published)
    @counts = [[5, 5], [10, 10], [30, 30], ["全て", -1]]
  end
end
