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

[
  [
    'OS', 100,
    [
      ['Linux', 2000],
      ['Solaris', 2100],
      ['AIX', 2110],
      ['HP-UX', 2120],
      ['IRIX', 2130],
      ['FreeBSD', 2140],
      ['MacOSX', 2200],
      ['リアルタイムUNIX', 2300],
      ['Windows', 2400],
      ['WindowsXP', 2410],
      ['WindowsNT', 2420],
      ['EmbeddedXP', 2430],
      ['Windows Server', 2440],
      ['WindowsCE', 2450],
      ['iOS', 2500],
      ['Android', 2600],
    ]
  ],
  [
    'プログラミング言語', 200,
    [
      ['ruby', 100],
      ['C', 300],
      ['C++', 300],
      ['Objective-C', 400],
      ['Java', 500],
      ['VB.NET', 600],
      ['C#', 700],
      ['PHP', 800],
      ['Python', 900],
      ['Tcl/Tk', 1000],
      ['VB', 1100],
      ['PL/SQL', 1200],
      ['JavaScript', 1300],
      ['AppleScript', 1400],
      ['シェルスクリプト', 1500],
    ]
  ],
  [
    'フレームワーク', 300,
    [
      ['Django', 100],
      ['struts', 200],
      ['SAStruts', 300],
      ['FormWave', 400],
      ['CakePHP', 500],
      ['CodeIgniter', 600],
      ['Laravel', 700],
      ['rails', 800],
    ]
  ],
  [
    'DB', 400,
    [
      ['Oracle', 100],
      ['MySQL', 200],
      ['PostgreSQL', 300],
      ['SQL Server', 400],
      ['Sybase', 500],
    ]
  ],
  ['クラウド', 500, [['AWS', 100], ['GCP', 200]]],
  ['仮想化', 600, [['Docker', 100]]],
  [
    'アプリケーションサーバ', 1000,
    [
      ['tomcat', 100],
      ['WebLogic', 200],
      ['WebShere', 300],
    ]
  ],
  ['CMS', 1100, [['SITE PUBLIS', 100]]],
  ['その他', 99999, [['Adobe Illustrator', 100], ['MS SQL Server Reporting Service', 200]]],
].each do |elem|
  category = TechCategory.create(name: elem[0], display_order: elem[1])
  elem[2].each do |tag|
    category.tech_tags << TechTag.build(name: tag[0], display_order: tag[1])
  end
end if TechCategory.count == 0
