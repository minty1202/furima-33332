class UserBuy
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :token, presence: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                   phone_number: phone_number, building: building, order_id: order.id)
  end
end
