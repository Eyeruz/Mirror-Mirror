class ItemsController < ApplicationController
before_action :find_item, only: [:edit, :update, :show, :destroy]
before_action :find_category, only: [:edit, :update]
before_action :must_be_logged_in 
skip_before_action :must_be_logged_in, only: [:index]

    def index
     @items = Item.order_by_name
    end
        
        
        def new
         
         @item = Item.new
         @category_id = params[:category_id]
        end
        
        
  def create

  @category = Category.find(params[:customer][:items][0][:category_id])
    @item = Item.create(item_params)
    @item.creator = current_customer.id
  @item.quantity = params[:customer][:items][0][:quantity].to_i
    if @item.save
        @item.categories << @category
          redirect_to category_item_path(@category, @item)
      end
    end
               

 
        
 def update

   if current_customer.id == @item.creator.to_i
    @item.update(item_params)
 
    redirect_to category_item_path(@item)
   else
      redirect_to category_item_path(@item)
      flash[:alert] = "Error Must be Owner of item to make changes"
     end
   end


      
        
    
        private
        
        def item_params
        params.require(:item).permit(:name, :size, :quantity, :color, :price, :creator, 
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
              redirect_to root_path
            end

        
          end
        
end
