class CustomersController < ApplicationController
 
        def new 
    
        @customer = Customer.new
        end
        
        
        def create
        @customer = Customer.new(customer_params)
        if @customer.save
        session[:user_id] = @customer.id
        redirect_to root_path
        else
         flash[:alert] = @customer.errors.full_messages.join(", ")
         redirect_to '/signup'
             end
           end
        
        
        def edit
        
        
        end
        
        
        def update
        
        
        end
        
        
        
        def show
        
        
        end
        
        
        def destroy
        
        
        end
        
        private
        
        def customer_params
        
            params.require(:customer).permit( :username, :email, :password_digest)
        end
        
end
