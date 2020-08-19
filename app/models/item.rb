class Item < ApplicationRecord
    has_many :category_items
    has_many :categories, through: :category_items
    has_many :customer_items
    has_many :customers, through: :customer_items
    accepts_nested_attributes_for :categories




end
