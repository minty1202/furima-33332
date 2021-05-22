class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(buy_params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
