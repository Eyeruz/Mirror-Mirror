class CustomersController < ApplicationController
 
        def new 
          @customer = Customer.new
        end
        
        
        def create
          @customer = Customer.new(customer_params)
             if !@customer.create_method(session)
            flash[:alert] = @customer.errors.full_messages.join(", ")
                redirect_to '/signup'
         else
          redirect_to items_path
          end
        end
        
        
       

        def checkout
            customer_items.current_customer.clear
         end
        
         private
        
        def customer_params
         params.require(:customer).permit(:username, :email, :password)
        end
        
end
