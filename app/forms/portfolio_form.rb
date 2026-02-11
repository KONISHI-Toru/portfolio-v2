class PortfolioForm
  include ActiveModel::Model

  attr_accessor :user_id, :tech_tag_ids, :count

  validates :user_id, presence: true, on: :show

  def initialize(*args, &block)
    super *args, &block
    self.tech_tag_ids = {} if self.tech_tag_ids.blank?
  end

  def search
    project_ids = TechTag.project_ids(tech_tag_ids.values.flatten)

    projects = Project.with_attached_sw_diagram
                       .with_attached_hw_diagram
                       .includes(%i[positions phases tech_tags])

    # user_id は必須。
    projects = projects.where(user_id: user_id)
                .published
    projects = projects.where(id: project_ids) if project_ids.present?
    projects = projects.order(from: :desc).order(to: :desc)
    projects = projects.limit(count) unless count.to_i == -1

    projects
  end
end
