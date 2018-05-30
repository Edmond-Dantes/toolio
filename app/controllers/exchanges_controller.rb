class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show]

  def index
    @borrower_exchanges = Exchange.where(user_id: current_user)
    @lender_exchanges = current_user.lender_exchanges
    @available_items = current_user.items.select {|item| item.exchange.nil?}
  end

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
    @item = @exchange.item
  end

  private

  def exchange_params
    params.require(:exchange).permit(:start_date, :end_date)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
