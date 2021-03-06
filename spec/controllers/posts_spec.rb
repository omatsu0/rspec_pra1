require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get posts_new_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("新規投稿")
      end
      it 'サブタイトルが正しく表示されていること' do
        expect(response.body).to include("投稿の作成ページです")
      end
    end
  end
end