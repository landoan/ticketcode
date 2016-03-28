require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  before do
    user = create(:user)
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before(:each) do
      post :create, location: attributes_for(:location), format: :js
    end
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

end
