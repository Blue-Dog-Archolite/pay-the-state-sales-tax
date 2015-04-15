require 'rails_helper'

RSpec.describe SalesTaxQuotesController, type: :controller do

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

  describe "POST #sales_tax_quotes", :vcr do
    let(:quote) {  { country: 'USA', zip: '83703' } }
    it 'returns http success' do
      post :create, sales_tax_quote: quote

      expect(response).to have_http_status(302)
    end
  end
end
