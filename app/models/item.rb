class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_status_id
      validates :delivery_id
      validates :prefecture_id
    end
  end

  has_one :order
  belongs_to :category
  belongs_to :status
  belongs_to :fee_status
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :user

  has_one_attached :image
end
