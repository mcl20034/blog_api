require 'rails_helper'

RSpec.describe "Api::V1::ArticlesController", type: :request do
  describe "Articles" do
    context "CRUD Articles" do
      before do
        @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'kuban.io')
        @article = Article.create!(title: Faker::Artist.name, content: Faker::Books::Dune.quote)
        @article2 = Article.create!(title: Faker::Artist.name, content: Faker::Books::Dune.quote)
        @article3 = Article.create!(title: Faker::Artist.name, content: Faker::Books::Dune.quote)
      end

      it "get articles" do
        get "/api/v1/articles", {
          params: {
          },
          headers: header(@user.token)
        }
        res = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(res.count).to eq(3) 
      end
  
      it "create Article" do
        post "/api/v1/articles", {
          params: {
            title: 'title',
            content: 'content'
          },
          headers: header(@user.token)
        }
        res = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end
    end      
  end

  def header(token)
    {
      'Accept' => 'application/json',
      'Authorization' => token
    }
  end
end