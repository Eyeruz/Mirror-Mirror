class ItemsController < ApplicationController
  #   before_action :require_login
  # skip_before_action :require_login, only: [:index]
 
    
    def index
    @items = Item.all
        end
        
        
        def new
         
        @item = Item.new
  
        end
        
        
        def create
     
        @item = Item.create(name: params[:name], price: params[:price], 
        quantity: params[:quantity], size: params[:size], creator_id: session[:user_id])

      if @item.save
        redirect_to item_path(@item)
        end
    end
        
        def edit
        
          @item = Item.find(params[:id])
        
        end
        
        
        def update
        
        
        end
        
        
        
        def show
        
        @item = Item.find(params[:id])
        end
        
        
        def destroy
          session[user_id].destroy
      end
        
        private
        
        def item_params
        
             params.require(:item).permit(:name, :size, :quantity, :colors, :price)
        end

        def require_login
            return head(:forbidden) unless session.include? :customer_id
          end
        
end
