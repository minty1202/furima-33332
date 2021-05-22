class Order < ApplicationRecord
  attr_accessor :token

  has_one :adress
  belongs_to :item
  belongs_to :user
end
