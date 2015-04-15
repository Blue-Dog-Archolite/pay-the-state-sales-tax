require 'rails_helper'

describe SalesTaxQuote, type: :model do
  let(:sales_tax) { FactoryGirl.build(:sales_tax_quote) }

  it 'updates internal values after Taxjar call', :vcr do
    expect(Taxjar).to receive(:client).and_call_original

    sales_tax.look_up_tax_rates!

    {
      "state"=>"ID",
      "zip"=>"83702",
      "state_rate"=>0.06,
      "city"=>"BOISE",
      "city_rate"=>"0.0",
      "country"=>"USA",
      "county"=>"BOISE",
      "county_rate"=>"0.0",
      "combined_district_rate"=>"0.0",
      "combined_rate"=>"0.06"
    }.each do |key, value|
      expect(sales_tax.send(key)).to eq(value)
    end
  end
end
