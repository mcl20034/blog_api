require 'rails_helper'

RSpec.describe "Api::V1::SessionsController", type: :request do
  describe "Sessions" do
    let(:user) {User.create!(name: 'zhang3', email: 'kuban@kuban.io', password: 'kuban.io')}

    it "create Sessions" do
      post "/api/v1/sessions", {
        params: {
          email: user.email,
          password: user.password
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(res['name']).to eq(user.name) 
    end

    it "can not signup with exits email" do
      post "/api/v1/sessions/signup", {
        params: {
          name: user.name,
          email: user.email,
          password: user.password
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(401)
    end

    it "can signup" do
      post "/api/v1/sessions/signup", {
        params: {
          name: 'li4',
          email: 'li4@kuban.io',
          password: 'kuban.io'
        },
        headers: {
          'Accept' => 'application/json'
        }
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(res['name']).to eq('li4') 
    end
  end
  
end