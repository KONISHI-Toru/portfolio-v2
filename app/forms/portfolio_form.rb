class PortfolioForm
  include ActiveModel::Model

  attr_accessor :user_id, :tech_tag_ids, :count

  validates :user_id, presence: true, on: :show

  def initialize(*args, &block)
    super *args, &block
    self.tech_tag_ids = {} if self.tech_tag_ids.blank?
  end

  def search
    projects = Project.with_attached_sw_diagram
                       .with_attached_hw_diagram
                       .includes(%i[positions phases tech_tags])

    # user_id は必須。
    projects = projects.where(user_id: user_id)
                .published
    projects = projects.joins(:tech_tags).merge(TechTag.where(id: tech_tag_ids.values.flatten)) if self.tech_tag_ids.present?
    projects = projects.order(from: :desc).order(to: :desc)
    projects = projects.limit(count) unless count.to_i == -1

    projects
  end
end
