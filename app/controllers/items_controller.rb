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
        if :is_the_creator
         @item.update(item_params)
         redirect_to category_item_path(@item)
        elsif :is_not_the_creator
          flash[:alert] = @item.errors.full_messages.join(", ")
          redirect_to category_item_path(@item)
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
