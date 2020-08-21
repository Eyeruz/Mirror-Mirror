class Item < ApplicationRecord
    has_many :category_items
    has_many :categories, through: :category_items
    has_many :customer_items
    has_many :customers, through: :customer_items
    accepts_nested_attributes_for :categories


scope :order_by_name, -> { order(name: :asc)}
scope :order_by_price_up, -> { order(price: :asc)}
scope :order_by_price_down, -> { order(price: :desc)}



end
