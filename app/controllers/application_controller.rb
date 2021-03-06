class ApplicationController < ActionController::Base
helper_method :logged_in?, :flash_error, :current_customer



   def current_customer 
    Customer.find_by_id(session[:user_id]) 
  
        end
      
def logged_in?
    !!session[:user_id]
     #get a true or false 
     #this is true 
   end
   

   def flash_error
if params[:customer][:username] == nil || params[:customer][:username] == ""
  flash[:alert] = "Username can't be left blank"
elsif params[:customer][:password] == nil || params[:customer][:password] == ""
  flash[:alert] = "Password can't be left blank"
else
 flash[:alert] = "Wrong Email, Username, or Password"
end
 end
   
def redirect_to_if_logged_in
     redirect_to root_path if logged_in?
   end 
   
   def redirect_to_if_not_logged_in
    if !logged_in?  
    flash[:alert] = "Login to View this Page"
    redirect_to root_path 
    end
   end
   
   
        
end
