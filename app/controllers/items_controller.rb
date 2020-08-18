class ItemsController < ApplicationController
    before_action :require_login, except: [:index]
 
    
    def index
    @items = Item.all
        end
        
        
        def new
        
        @item = Item.new
  
        end
        
        
        def create
          
    @item = Item.create(item_params)
      if @item.save
        session[:user_id] = @item.creator_id
          redirect_to item_path(@item)
      end
    end
        
        def edit
        
          @item = Item.find(params[:id])
        
        end
        
        
        def update
        
        
        end
        
        
        
        def show
          redirect_to_if_not_logged_in 
        @item = Item.find(params[:id])
        end
        
        
        def destroy
          session[user_id].destroy
      end
        
        private
        
        def item_params
        
             params.require(:item).permit(:name, :size, :quantity, :color, :price, creator_id: :user_id)
          
        end

        def require_login
            return head(:forbidden) unless session.include? :user_id
          end
        
end
