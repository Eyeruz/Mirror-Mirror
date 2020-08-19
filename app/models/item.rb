class Item < ApplicationRecord
    has_many :category_items
    has_many :categories, through: :category_items
    has_many :customer_items
    has_many :customers, through: :customer_items
    accepts_nested_attributes_for :categories

scope :is_the_creator, -> { where(session[:user_id] == @item.creator_id ) }

scope :is_not_the_creator, -> { where(session[:user_id] != @item.creator_id || @item.creator_id = nil || @item.creator_id = " " ) }


scope :fields_with_errors, -> { where(  ) }

end
