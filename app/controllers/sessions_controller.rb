class SessionsController < ApplicationController 


    def new
        redirect_to_if_logged_in

    end



    def create
        @customer = Customer.find_by(username: params['/login'][:username])
        if params['/login'][:password_digest] == params['/login'][:password_confirmation] && @customer.password_digest
        
    @customer.save
        session[:user_id] = @customer.id
        redirect_to root_path
        else
            redirect_to '/login'
            flash_error
     end
      end

    def destroy
        session.clear
        redirect_to root_path
    end

end