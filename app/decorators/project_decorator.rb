class ProjectDecorator < Draper::Decorator
  delegate_all

  def title
    value = ''
    if self.target.present?
      value += "#{self.target} "
    end
    value += self.name
  end

  # プロジェクトの期間を表示するためのヘルパー。
  def project_period
    from = ""
    if object.from.present?
      from = object.from.strftime('%Y年%-m月')
    end
    to = ""
    if object.to.present?
      to = object.to.strftime('%Y年%-m月')
    end
  
    if from == "" && to == ""
      return ""
    end
  
    "#{from} 〜 #{to}"
  end
  
  def has_hw_configuration?
    object.hw_configuration.present? || object.hw_diagram.attached?
  end

  def has_sw_configuration?
    object.sw_configuration.present? || object.sw_diagram.attached?
  end

end
