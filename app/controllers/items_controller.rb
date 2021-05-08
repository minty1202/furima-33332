class ItemsController < ApplicationController
  before_action :move_to_root, except: :index

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :fee_status_id, :prefecture_id, :delivery_id, :price,:image).merge(user_id: current_user.id)
  end
  
  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
