class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :destroy]

  def index
    # @items = Item.paginate(:page => params[:page], :per_page => 12)
    if user_signed_in?
      # [current_user.latitude, current_user.longitude]
      users_near = User.near(current_user.to_coordinates, 50).map {|user| user.username}
      @items = Item.joins(:user).where('users.username IN (?)', users_near).paginate(:page => params[:page], :per_page => 12)

    else
      @items = Item.paginate(:page => params[:page], :per_page => 12)
    end


    @markers = @items.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render 'items/new'
    end
  end

  def show
    @exchange = Exchange.new
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:id, :name, :description, :token_value, :photo, :user_id)
  end
end
