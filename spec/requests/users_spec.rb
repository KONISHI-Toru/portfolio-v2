require 'rails_helper'

RSpec.describe "【ログイン】", type: :request do
  let(:login_path) { '/users/sign_in' }
  let(:top_path) { '/' }

  let (:login_user) { FactoryBot.create(:user) }
  let (:login_params) {
    {
      user: {
        email: login_user.email,
        password: login_user.password  
      }
    }
  }
  subject { post login_path, params: login_params }

  before do
    # @request.env["devise.mapping"] = Devise.mapping[:user]
  end

  it 'ログイン画面が表示されること' do
    get login_path
    expect(response).to have_http_status(:success)
    expect(response.body).to include 'ログイン'
  end

  describe 'ログイン' do
    context '有効なユーザの場合' do
      it 'ログインできること' do
        is_expected.to eq(303)
        expect(response).to redirect_to top_path
      end   
    end

    context 'パスワードが間違っている場合' do
      before do
        login_params[:user][:password] = 'invalid_password'
        Rails.logger.debug(login_params)
      end
      it 'ログインに失敗すること' do
        is_expected.to eq(422)
        expect(response.body).to include 'ログイン'
      end   
    end

    context '無効なユーザの場合' do
      let (:login_user) { FactoryBot.create(:user, :not_available) }
      it 'ログインに失敗すること' do
        is_expected.to eq(422)
        expect(response.body).to include 'ログイン'
      end   
    end
  end
end
