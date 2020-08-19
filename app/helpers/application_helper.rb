module ApplicationHelper
    
    def category_name
        item = Item.all 
item.catgories.map {|c| c.name}
    end
end
