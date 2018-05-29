class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show]
  def create
    @item = Item.find(params[:item_id])
    @exchange = Exchange.new(exchange_params)
    @exchange.item = @item
    @exchange.user = current_user
    if @exchange.save
      redirect_to exchange_path(@exchange)
    else
      render 'items/show'
    end
  end

  def show
    # raise
  end

  private

  def exchange_params
    params.require(:exchange).permit(:start_date, :end_date)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
