class PortfolioForm
  include ActiveModel::Model

  attr_accessor :user_id, :tech_tag_ids, :count

  validates :user_id, presence: true, on: :show

  def initialize(*args, &block)
    super *args, &block
    self.tech_tag_ids = {} if self.tech_tag_ids.blank?
  end

  def search
    # condition = Project.with_attached_sw_diagram
    #                    .with_attached_hw_diagram
    #                    .includes(%i[roles phases tech_tags])

    # # user_id は必須。
    # condition = condition.where(user_id: user_id)
    # if tech_tag_ids.present?
    #   # タグはカテゴリ単位でAND条件とする。
    #   project_ids = []
    #   tech_tag_ids.each_with_index do |(key, ids), idx|
    #     ids = ProjectTechTag.where(tech_tag_id: ids).pluck(:project_id)
    #     if idx == 0
    #       project_ids = ids
    #     else
    #       project_ids = project_ids & ids
    #     end
    #   end
    #   condition = condition.where(id: project_ids)
    # end
    # condition = condition.where(published: true)
    # condition = condition.order(from: :desc).order(to: :desc)
    # condition = condition.limit(count) unless count.to_i == -1

    # condition
  end
end
