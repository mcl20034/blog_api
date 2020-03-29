require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "CRUD Users" do
    let(:user) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'kuban.io')}
    let(:user2) {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'kuban.io')}

    it "get User" do
      get "/api/v1/users/#{user.id}", {
        params: {
        },
        headers: header(user.token)
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(res['name']).to eq(user.name)
    end

    it "update User" do
      put "/api/v1/users/#{user.id}", {
        params: {
          name: 'li4'
        },
        headers: header(user.token)
      }
      res = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(res['name']).to eq('li4')
    end
    
    it "can not update other User" do
      put "/api/v1/users/#{user2.id}", {
        params: {
          name: 'li4'
        },
        headers: header(user.token)
      }
      res = JSON.parse(response.body)
      pp res
      expect(response.status).to eq(403)
    end

  end

  def header(token)
    {
      'Accept' => 'application/json',
      'Authorization' => token
    }
  end
end
