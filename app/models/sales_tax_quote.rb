class SalesTaxQuote < ActiveRecord::Base
  before_save :update_tax_rate
  validate :zip_code_and_country

  private


  def zip_code_and_country
    return true
#    errors.add(:field, 'error message')
  end

  def update_tax_rate
    return unless self.changed?

#  options = {
#    zip: "07446",
#    country: "US"
#  }

#  self.rate = Taxjar.client.tax_rate(zip: zip_code, country: country_code)
  end
end
