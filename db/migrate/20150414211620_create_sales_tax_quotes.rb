class CreateSalesTaxQuotes < ActiveRecord::Migration
  def change
    create_table :sales_tax_quotes do |t|
      t.string  :state
      t.string  :zip
      t.float   :state_rate
      t.string  :city
      t.string  :city_rate
      t.string  :country
      t.string  :county
      t.string  :county_rate
      t.string  :combined_district_rate
      t.string  :combined_rate

      t.timestamps
    end
  end
end
