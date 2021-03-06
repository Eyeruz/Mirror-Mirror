class SessionsController < ApplicationController 


    def new
      @customer = Customer.new
 
    end

    def facebook
     
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |u|
          u.username = auth['info']['name']
          u.email = auth['info']['name'] + '@email.com'
          u.image = auth['info']['image']
          u.password = SecureRandom.hex
        end
         session[:user_id] = @customer.id
        redirect_to items_path
      end


def create

  @customer = Customer.find_by(username: params[:customer][:username])
  if @customer && @customer.authenticate(params[:customer][:password])
if @customer.save
    session[:user_id] = @customer.id
    redirect_to items_path
      else
        flash_error 
        redirect_to '/signin'
      end
  else
    flash_error 
    redirect_to '/signin'
    end
  end

        
  def userinfo

@customer = current_customer
  end 
  
  def destroy
    session.clear
    redirect_to root_path
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end


end