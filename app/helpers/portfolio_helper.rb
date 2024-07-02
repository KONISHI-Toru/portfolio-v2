module PortfolioHelper
  # 文字列を数値文字参照に変換する。
  def numerical_character_references(str)
    if str.nil?
      return ""
    end

    str.bytes.map { |v| "&\#x#{v.to_s(16)};" }.join
  end

  # Unicode数値参照で偽装したmailtoリンクを生成する。
  def mailto_link(user)
    if user.nil?
      return ""
    end

    mailto = numerical_character_references("mailto:")
    converted = numerical_character_references(user.email)
    tag.a converted, href: "#{mailto}#{converted}", escape: false
  end
end
