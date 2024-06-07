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
