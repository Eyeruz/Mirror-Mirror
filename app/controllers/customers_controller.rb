class CustomersController < ApplicationController
    def index
        # @items = Item.all
        end
        
        
        def new
        # @item = Item.new
        
        end
        
        
        def create
        
        # @item = Item.create(item_params)
        # if @item.save
        #     redirect_to item_path(@item)
        end
        
        
        def edit
        
        
        end
        
        
        def update
        
        
        end
        
        
        
        def show
        
        
        end
        
        
        def delete
        
        
        end
        
        private
        
        def item_params
        
            params.require(:item).permit( :size, :quanity, :color, :price)
        end
        
end
