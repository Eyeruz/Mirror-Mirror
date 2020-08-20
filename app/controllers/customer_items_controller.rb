class CustomerItemsController < ApplicationController

def index

@items = current_customer.customer_items.uniq


end



def new

    @item = CustomerItem.new

end



def create 

    ar = params[:customer][:items].select {|items| items[:quantity] != "0"}
    if ar.empty? 
    #   flash[:alert] = "No items selected, select the quantity of items to add in your bag."
      redirect_to root_path
    else

      ar.each do |items|
        
   item = Item.find(items[:item_id])

   ci = CustomerItem.find_or_create_by(customer_id: current_customer.id, item_id: item.id)
   if ci.quantity == nil 
    ci.update(quantity:items[:quantity]) 
  
   else

    q = items[:quantity].to_i
    ci.update(quantity: ci.quantity += q )
   end
  end

    end
    redirect_to customer_items_path
      end   



def edit


end


def update


end


def show

@item = current_customer.customer_items.find(params[:id])
end


def new

end

def checkout
    
    current_customer.customer_items.clear

    redirect_to customer_items_path

end

private


def customeritem_params

    params.require(:customer).permit(:customer, :item)

end



    
end
