module ApplicationHelper
  def nl2br(str)
    raw(h(str).gsub("\n", tag.br))
  end

  def alert_type(message_type)
    type = ""
    type = "info" if message_type == "notice"
    type = "warning" if message_type == "warning"
    type = "danger"  if message_type == "alert"
    type
  end
end
