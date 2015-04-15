class SalesTaxQuote < ActiveRecord::Base
  validates :zip, :country, presence: true

  def look_up_tax_rates!
    rate = Taxjar.client.tax_rate(zip: zip, country: country)
    update_attributes(rate['location'])
  end
end
