require 'rails_helper'

RSpec.describe Api::V1::ArticlesController type: :controller do
  describe "CRUD Articles" do
    it "get articles" do
      post "/api/v1/articles", {
        params: {
          title: 'title',
          content: 'content'
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
    it "create Article" do
      post "/api/v1/articles", {
        params: {
          title: 'title',
          content: 'content'
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end
  
end