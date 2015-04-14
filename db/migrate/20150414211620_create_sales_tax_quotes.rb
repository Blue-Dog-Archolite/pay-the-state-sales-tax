class CreateSalesTaxQuotes < ActiveRecord::Migration
  def change
    create_table :sales_tax_quotes do |t|
      t.string  :country_code
      t.string  :zip_code
      t.float   :rate

      t.timestamps
    end
  end
end
