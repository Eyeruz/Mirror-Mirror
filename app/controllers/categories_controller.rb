class CategoriesController < ApplicationController
    before_action :require_login
  skip_before_action :require_login, only: [:index]
 
   
   
    def index
        @categories = Category.all
        end
    
     
        
        def show
    @category = Category.find(params[:id])
        end
    
       private 

        def require_login
            return head(:forbidden) unless session.include? :user_id
          end
        
end
