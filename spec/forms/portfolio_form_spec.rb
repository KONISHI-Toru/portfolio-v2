require 'rails_helper'

RSpec.describe PortfolioForm, type: :form do
  describe 'search' do
    let(:target_user) { FactoryBot.create(:user, :published) }
    let!(:phases) {
      [
        FactoryBot.create(:phase, name: '要件定義', display_order: 1),
        FactoryBot.create(:phase, name: '設計', display_order: 2),
        FactoryBot.create(:phase, name: '実装', display_order: 3)
      ]
    }
    let!(:positions) {
      [
        FactoryBot.create(:position, name: 'リーダー', display_order: 1),
        FactoryBot.create(:position, name: 'サブリーダー', display_order: 2),
        FactoryBot.create(:position, name: 'メンバー', display_order: 3)
      ]
    }
    let!(:tech_tags)  {
      categories = [
        FactoryBot.create(:tech_category, name: 'プログラミング言語', display_order: 1),
        FactoryBot.create(:tech_category, name: 'フレームワーク', display_order: 2)
      ]
      categories[0].tech_tags << FactoryBot.build(:tech_tag, name: 'Ruby', display_order: 1)
      categories[0].tech_tags << FactoryBot.build(:tech_tag, name: 'PHP', display_order: 2)
      categories[0].tech_tags << FactoryBot.build(:tech_tag, name: 'Python', display_order: 3)
      categories[1].tech_tags << FactoryBot.build(:tech_tag, name: 'Rails', display_order: 1)
      categories[1].tech_tags << FactoryBot.build(:tech_tag, name: 'Laravel', display_order: 2)
      categories[1].tech_tags << FactoryBot.build(:tech_tag, name: 'Django', display_order: 3)
      categories[1].tech_tags << FactoryBot.build(:tech_tag, name: 'CakePHP', display_order: 4)
      categories.flat_map(&:tech_tags)
    }
    let(:params) {
      {
        user_id: target_user.id.to_s,
        count: '3'
      }
    }
    context 'データがない場合' do
      it '空のリストが返されること' do
        form = PortfolioForm.new(params)
        result = form.search
        expect(result).to be_empty
      end
    end
    context '件数が指定より少ない場合' do
      let!(:projects) {
        value = []
        value << FactoryBot.create(:project, user: target_user, from: "2023-01-01", to: "2023-06-30", published: true)
        value << FactoryBot.create(:project, user: target_user, from: "2023-02-01", to: "2023-03-30", published: true)
        value
      }
      it '空のリストが返されること' do
        form = PortfolioForm.new(params)
        result = form.search
        expect(result.length).to eq 2
      end
    end
    context '件数が指定より多い場合' do
      let!(:projects) {
        FactoryBot.create_list(:project, 5, user: target_user, published: true)
      }
      it '空のリストが返されること' do
        form = PortfolioForm.new(params)
        result = form.search
        expect(result.length).to eq 3
      end
    end
    context '技術タグで絞り込まれている場合' do
      let!(:projects) {
        FactoryBot.create_list(:project, 5, user: target_user, published: true)
      }
      before(:each) do
        # 2つのプロジェクトに技術タグを設定。
        projects[1].tech_tags << tech_tags[0]  # Ruby
        projects[1].tech_tags << tech_tags[1]  # PHP

        params[:tech_tag_ids] = {
          tech_tags[0].tech_category_id.to_s => [
            tech_tags[0].id.to_s, tech_tags[1].id.to_s
          ]
        }  # Ruby, PHP
      end
      it '該当する1件のみ返されること' do
        form = PortfolioForm.new(params)
        result = form.search
        expect(result.length).to eq 1
      end
    end
  end
end
