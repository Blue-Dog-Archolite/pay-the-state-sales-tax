require 'rails_helper'

RSpec.describe SalesTaxQuoteController, type: :controller do

  describe "GET #country:string" do
    it "returns http success" do
      get :country:string
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #state_name:string" do
    it "returns http success" do
      get :state_name:string
      expect(response).to have_http_status(:success)
    end
  end

end
