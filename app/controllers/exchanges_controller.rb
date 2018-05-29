class ExchangesController < ApplicationController
  def create

    @exchange = Exchange.new(exchange_params)


  end

  def show

  end

  private

  def exchange_params
    params.require(:exchange).permit(:start_date, :end_date)
  end
end
