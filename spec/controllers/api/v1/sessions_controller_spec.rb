require 'spec_helper'

RSpec.describe SessionsController type: :controller do
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
    end
  end
  
end