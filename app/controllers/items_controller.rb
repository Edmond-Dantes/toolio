class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :destroy]

  def index
    if user_signed_in?
      # current_user.to_coordinates => [current_user.latitude, current_user.longitude]
      users_near = User.near(current_user.to_coordinates, 50).map { |user| user.username }

      # paginate_settings => :page => params[:page], :per_page => 12

      @items = Item.joins(:user).where('users.username IN (?)', users_near).paginate(page: params[:page], per_page: 8)

      if params[:query].present?
        items_near_current_user = Item.joins(:user).where('users.username IN (?)', users_near)
        items_ncu_filtered = items_near_current_user.search_by_name_and_description(params[:query])
        @items = items_ncu_filtered.paginate(page: params[:page], per_page: 8)
      end
    else
      users_near = User.near('Tokyo, Japan', 100).map { |user| user.username }
      # @items = Item.all.paginate(page: params[:page], per_page: 12)
      @items = Item.joins(:user).where('users.username IN (?)', users_near).paginate(page: params[:page], per_page: 8)
      if params[:query].present?
        items_anonymous_filtered = Item.search_by_name_and_description(params[:query])
        @items = items_anonymous_filtered.paginate(page: params[:page], per_page: 8)
      end
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
    @markers = [@item].map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
