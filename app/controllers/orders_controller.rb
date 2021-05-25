class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  before_action :order_check, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :order_no_seller, only: [:index, :create]

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    @item = Item.find(buy_params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def order_check
    redirect_to root_path if @item.order.present?
  end

  def order_no_seller
    redirect_to root_path if @item.user.id == current_user.id
  end
end
