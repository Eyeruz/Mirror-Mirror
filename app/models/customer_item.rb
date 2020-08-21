class CustomerItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer




  def self.create_method(current_customer)
    if !current_customer 
      flash[:alert] = "Sign In to Add Items To Your Bag"
      redirect_to items_path   
  else
ar = params[:customer][:items].select {|items| items[:quantity] != "0"}
if ar.empty?
  flash[:alert] = "No items selected, select the quantity of items to add in your bag."
  redirect_to items_path   
else
  ar.each do |items|
      item = Item.find(items[:item_id])
  
      ci = self.find_or_create_by(customer_id: current_customer.id, item_id: item.id)
      if ci.quantity == nil 
          ci.update(quantity:items[:quantity]) 
      else
         q = items[:quantity].to_i
           ci.update(quantity: ci.quantity += q )
        end
      end
      redirect_to customer_items_path

    end
  end
end
end
