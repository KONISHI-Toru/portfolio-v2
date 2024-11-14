require 'rails_helper'

RSpec.describe "Portfolios", type: :request do
  $current_response = nil

  shared_examples "応答が正常であること" do
    it {
      is_expected.to eq(200)
      expect(response.body).to include '<h1>ポートフォリオ</h1>'
      $current_response = response
    }
  end
  shared_examples "ログインボタンが表示されていること" do
    it { expect($current_response.body).to include '>ログイン</a>' }
  end
  shared_examples "ログアウトボタンが表示されていること" do
    it { expect($current_response.body).to include '>ログアウト</a>' }
  end
  shared_examples "指定したユーザのプロジェクトが表示されていること" do
    it {
      $target_projects.each do |proj|
        expect($current_response.body).to include "<summary>#{proj.target} #{proj.name}</summary>"
      end
    }
  end

  describe "GET /" do
    let(:login_user) {
      FactoryBot.create(:user, :published)
    }
    subject { get root_path }

    before(:context) do
      $current_response = nil
    end

    context 'ログインしていない場合' do
      include_examples "応答が正常であること"
      include_examples "ログインボタンが表示されていること"
    end

    context 'ログインしている場合' do
      before(:each) do
        sign_in login_user
      end

      include_examples "応答が正常であること"
      include_examples "ログアウトボタンが表示されていること"
    end
  end

  describe "GET /show" do
    let(:params) {
      {
        portfolio_form: {
          user_id: $target_user.id,
          count: 5
        }
      }
    }
    subject { get portfolio_show_path, params: params }
    before(:all) do
      $current_response = nil

      $login_user = FactoryBot.create(:user, :published)
      $target_user = FactoryBot.create(:user, :published)
      FactoryBot.create_list(:project, 3, user: $login_user)
      $target_projects = FactoryBot.create_list(:project, 3, user: $target_user)

      if $is_login
        sign_in login_user
      end
    end
    after(:all) do
      Project.delete_all
      Profile.delete_all
      User.delete_all
    end

    context 'ログインしていない場合' do
      include_examples "応答が正常であること"
      include_examples "ログインボタンが表示されていること"
      include_examples "指定したユーザのプロジェクトが表示されていること"
    end

    context 'ログインしている場合' do
      before(:each) do
        sign_in $login_user
      end

      include_examples "応答が正常であること"
      include_examples "ログアウトボタンが表示されていること"
      include_examples "指定したユーザのプロジェクトが表示されていること"
    end
  end
end
