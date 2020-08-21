class CategoriesController < ApplicationController
 
   
   
    def index
        @categories = Category.all
        end
    
     
        
        def show
    @category = Category.find_by(id: params[:id])
    @item = Item.new
        end

end
