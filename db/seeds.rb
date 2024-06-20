# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_email = ENV.fetch("ADMIN_EMAIL", nil)
admin_password = ENV.fetch("ADMIN_PASSWORD", nil)

user = User.create(
    email: admin_email,
    password: admin_password,
    available: true,
) if admin_email.present? && admin_password.present?

Profile.create(
    user_id: user.id,
    name: 'システム管理者',
    published: true
) if user.present?

[
  ['要件定義', 100],
  ['技術調査', 200],
  ['設計', 300],
  ['開発', 400],
  ['テスト', 500],
  ['運用', 600],
].each do |elem|
  Phase.create(name: elem[0], display_order: elem[1])
end if Phase.count == 0

[
  ['マネージャー', 100],
  ['SE', 200],
  ['プログラマ', 300],
  ['テスター', 400],
].each do |elem|
  Position.create(name: elem[0], display_order: elem[1])
end if Position.count == 0
