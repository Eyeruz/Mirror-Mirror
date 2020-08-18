class ApplicationController < ActionController::Base
helper_method :current_customer, :logged_in?, :redirect_to_if_logged_in, :redirect_to_if_not_logged_in 

   def current_customer 
    Customer.find_by_id(session[:user_id]) 
        end
      
def logged_in?
    !!session[:user_id]
     #get a true or false 
     #this is true 
   end
   
   
   
   def redirect_to_if_logged_in
     redirect root_path if logged_in?
   end 
   
   def redirect_to_if_not_logged_in 
     redirect root_path if !logged_in?
   end
   
   
        
end
