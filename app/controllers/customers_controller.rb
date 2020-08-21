class CustomersController < ApplicationController
 
        def new 
          @customer = Customer.new
        end
        
        
        def create
        @customer = Customer.new(customer_params)
        if !@customer.create_method(session)
            flash[:alert] = @customer.errors.full_messages.join(", ")
                redirect_to '/signup'
           end
        end
        
       

        def checkout
            customer_items.current_customer.clear
         end
        
         private
        
        def customer_params
         params.require(:customer).permit( :username, :email, :password_digest)
        end
        
end
