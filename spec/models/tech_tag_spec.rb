require 'rails_helper'

RSpec.describe TechTag, type: :model do
  describe '.project_ids' do
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
    let(:target_user) { FactoryBot.create(:user, :published) }
    let!(:projects) {
      value = []
      value << FactoryBot.create(:project, user: target_user, from: "2023-01-01", to: "2023-06-30", published: true, tech_tags: [ tech_tags[1], tech_tags[3] ])
      value << FactoryBot.create(:project, user: target_user, from: "2023-02-01", to: "2023-03-30", published: true, tech_tags: [ tech_tags[0], tech_tags[4] ])
      value << FactoryBot.create(:project, user: target_user, from: "2023-03-01", to: "2023-04-30", published: true, tech_tags: [ tech_tags[1], tech_tags[2] ])
      value << FactoryBot.create(:project, user: target_user, from: "2023-04-01", to: "2023-05-30", published: true, tech_tags: [ tech_tags[1], tech_tags[3] ])
      value << FactoryBot.create(:project, user: target_user, from: "2023-05-01", to: "2023-06-30", published: true, tech_tags: [ tech_tags[4] ])
      value
    }
    context '引数が空の場合' do
      it 'nilが返されること' do
        result = TechTag.project_ids([])
        expect(result).to be_nil
      end
    end
    context '技術タグのIDが指定されている場合' do
      it '該当するプロジェクトIDのリストが返されること' do
        ids = [ tech_tags[0].id, tech_tags[4].id ]
        result = TechTag.project_ids(ids)
        expect(result.sort).to eq [ projects[1].id, projects[4].id ]
      end
    end
  end
end
