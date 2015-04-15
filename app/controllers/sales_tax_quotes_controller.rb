class SalesTaxQuotesController < ApplicationController
  before_action :load_quote, only: [:show, :update]
  def new
    @sales_tax_quote = SalesTaxQuote.new
  end

  def index
    @quotes = SalesTaxQuote.all
  end

  def create
    quote = SalesTaxQuote.new(quote_allowed_params)

    quote.look_up_tax_rates!

    redirect_to quote
  end

  private

  def load_quote
    @quote = SalesTaxQuote.find(params[:id])
  end

  def quote_allowed_params
    params.require(:sales_tax_quote).permit(:zip, :country)
  end
end
