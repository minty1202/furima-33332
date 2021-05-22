class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :city
    validates :addresses
    validates :phone_number, numericality: {only_integer: true}, length: { maximum: 11 }
  end

  belongs_to :prefecture
end
