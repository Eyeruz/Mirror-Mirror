class ItemsController < ApplicationController
before_action :find_item, only: [:edit, :update, :show, :destroy]
before_action :find_category, only: [:edit, :update]
before_action :must_be_logged_in, except: :index

    def index
     @items = Item.order_by_name
    end
        
        
        def new
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
               

 
        
 def update
   if  current_customer = @item.creator_id 
    @item.update(item_params)
    redirect_to category_item_path(@item)
   else
      redirect_to category_item_path(@item)
      flash[:alert] = "Error Must be Owner of item to make changes"
     end
   end
        
      
        
    
        private
        
        def item_params
        params.require(:item).permit(:name, :size, :quantity, :color, :price, :creator_id, 
        categoires_attributes: [ :name ])
        end

          def find_item 
            @item = Item.find(params[:id])
          end

          def find_category
            @category = Category.find_by(id: params[:category_id])  
          end

          def must_be_logged_in
            if !current_customer
              flash[:alert] = "Must be logged in to view this page"
              redirect_to items_path
            end

          end
        
end
