class SessionsController < ApplicationController 


    def new

    end



    def create
        @customer = Customer.find_by(username: params['/login'][:username])
        return head(:forbidden) unless params['/login'][:password_digest] == @customer.password_digest
        if @customer.save
        session[:user_id] = @customer.id
        redirect_to root_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end