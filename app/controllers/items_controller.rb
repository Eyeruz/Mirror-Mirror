class ItemsController < ApplicationController

    
    def index
    @items = Item.all
        end
        
        
        def new
          redirect_to_if_not_logged_in 
        @item = Item.new
        
        end
        
        
        def create
  @category = Category.find(params[:item][:category_ids])
    @item = Item.create(item_params)
      if @item.save
        @item.categories << @category
          redirect_to category_item_path(@category, @item)
      end
    end
        
        def edit
        
          @category = Category.find(params[:category_id])  
          @item = Item.find(params[:id])
 
      
        end
        
        
        def update
          @item = Item.find(params[:id])
          @category = Category.find(params[:category_id])  
        if session[:user_id] == @item.creator_id 
         @item.update(item_params)
         redirect_to item_path(@item)
        elsif session[:user_id] != @item.creator_id || @item.creator_id = nil || @item.creator_id = " "
          flash[:alert] = "Error: Only owners of the item can make changes to item"
          redirect_to item_path(@item)
          end
        end
        
        
        
        def show
        @item = Item.find(params[:id])
        end
        
        
        def destroy
          session[user_id].destroy
      end
        
        private
        
        def item_params
        params.require(:item).permit(:name, :size, :quantity, :color, :price, :creator_id, 
        categoires_attributes: [ :name ])
          end

        
end
