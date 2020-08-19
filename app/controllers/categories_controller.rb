class CategoriesController < ApplicationController
 
   
   
    def index
        @categories = Category.all
        end
    
     
        
        def show
    @category = Category.find(params[:id])
    @item = Item.new
        end


        
    


    
        
end
