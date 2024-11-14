require 'rails_helper'

RSpec.describe ProjectDecorator do
  let(:user) { FactoryBot.create(:user, :published) }
  subject { project.decorate }

  describe 'project_period' do
    let(:from) { "2024-03-15" }
    let(:to) { "2024-06-15" }
    let(:project) {
      FactoryBot.build(:project, user: user, from: from, to: to)
    }
    context '開始、終了が設定されている場合' do
      it '「開始 〜 終了」と表示されること' do
        expect(subject.project_period).to eq '2024年3月 〜 2024年6月'
      end
    end
    context '開始のみが設定されている場合' do
      let(:to) { nil }
      it '「開始 〜 」と表示されること' do
        expect(subject.project_period).to eq '2024年3月 〜 '
      end
    end
    context '終了のみが設定されている場合' do
      let(:from) { nil }
      it '「 〜 終了」と表示されること' do
        expect(subject.project_period).to eq ' 〜 2024年6月'
      end
    end
  end

  describe 'tech_tags_text' do
    let(:project) { FactoryBot.build(:project, user: user) }

    context 'tech_tag が設定されている場合' do
      let(:tech_tag3) { FactoryBot.build(:tech_tag, display_order: 100) }
      let(:tech_tag2) { FactoryBot.build(:tech_tag, display_order: 10) }
      let(:tech_tag1) { FactoryBot.build(:tech_tag, display_order: 1) }
      before(:each) do
        project.tech_tags << tech_tag3
        project.tech_tags << tech_tag2
        project.tech_tags << tech_tag1
      end
      it '表示順にカンマ区切りで表示されること' do
        expect(subject.tech_tags_text).to eq "#{tech_tag1.name}, #{tech_tag2.name}, #{tech_tag3.name}"
      end
    end
    context 'tech_tag が設定されていない場合' do
      it '空文字列が表示されること' do
        expect(subject.tech_tags_text).to eq ''
      end
    end
  end

  describe 'phases_text' do
    let(:project) { FactoryBot.build(:project, user: user) }

    context 'フェーズが設定されている場合' do
      let(:phase3) { FactoryBot.build(:phase, display_order: 100) }
      let(:phase2) { FactoryBot.build(:phase, display_order: 10) }
      let(:phase1) { FactoryBot.build(:phase, display_order: 1) }
      before(:each) do
        project.phases << phase3
        project.phases << phase2
        project.phases << phase1
      end
      it '表示順にカンマ区切りで表示されること' do
        expect(subject.phases_text).to eq "#{phase1.name}, #{phase2.name}, #{phase3.name}"
      end
    end
    context 'フェーズが設定されていない場合' do
      it '空文字列が表示されること' do
        expect(subject.phases_text).to eq ''
      end
    end
  end

  describe 'positions_text' do
    let(:project) { FactoryBot.build(:project, user: user) }

    context '役割が設定されている場合' do
      let(:position3) { FactoryBot.build(:position, display_order: 100) }
      let(:position2) { FactoryBot.build(:position, display_order: 10) }
      let(:position1) { FactoryBot.build(:position, display_order: 1) }
      before(:each) do
        project.positions << position3
        project.positions << position2
        project.positions << position1
      end
      it '表示順にカンマ区切りで表示されること' do
        expect(subject.positions_text).to eq "#{position1.name}, #{position2.name}, #{position3.name}"
      end
    end
    context '役割が設定されていない場合' do
      it '空文字列が表示されること' do
        expect(subject.positions_text).to eq ''
      end
    end
  end
end
