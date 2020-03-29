RSpec.describe Api::V1::ArticlesController type: :request do
  context "CRUD Articles" do
    it "get articles" do
      post "/articles", {
        params: {
          title: 'title',
          content: 'content'
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      pp res
      expect(response.status).to eq(200)
    end
    it "create Article" do
      post "/articles", {
        params: {
          title: 'title',
          content: 'content'
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      pp res
      expect(response.status).to eq(200)
    end
  end
  
end