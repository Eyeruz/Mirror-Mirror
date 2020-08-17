Store (Mirror-Boutique)

User Model -has many Customer_items
has many items through Customer_items
username 
email
password_digest


# has many wishlist 
# has many items through wishlist


Item Model - has many Customer_items 
has many customers through Customer_items
integer:size
integer:quanity
string:color 
float:price
integer:creator_id

# has many wishlist

has many Categories_items
has many Categories through Categorie_items

Customer_items Model - belongs to User
belongs to Item 
user_id
items_id


seed file 1 user who is admin


Category Model has many Categorie_items
has many items through Categorie_items
-women
-men
 i want people to be able to choose a category based on what gender theyre shopping for. 

 build a seach form next to categoires.. to narrow down the search


Categorie_items Model belongs to Categories
belongs to Items


???????? Sell_items Model - belongs to customer
has_many items 
has_many customers through :items ????????
# Wishlist Model belongs to a customer
# belongs to item


* how am i going to meet the requirment of nested ??



# wishlist has many items 

# customer has a wish list

# items has many wishlists

home page add an item

has a list of all items..

opition of editing or deleting each item where customer_id == creator_id

choice of mens or womens

men page 

has edit for your items

women page 

has edit for your items 

nested routes 



steps..

after migrating.. do rails c (console)
    and test your code by trying to create something
reload! #after every test
rails c -s #so it doesnt save 

.errors #to see errors 
.save! #to see errors 


 'categoires/items/new'

 

