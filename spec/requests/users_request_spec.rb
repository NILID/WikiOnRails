require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get users_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get user_url(user, locale: :en)
      expect(response).to have_http_status(:success)
    end
  end

end
