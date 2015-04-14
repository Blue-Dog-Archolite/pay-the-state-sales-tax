class SalesTaxQuotesController < ApplicationController
  def new
    @sales_tax_quote = SalesTaxQuote.new
  end

  def index
    @quotes = SalesTaxQuote.all
  end

end
