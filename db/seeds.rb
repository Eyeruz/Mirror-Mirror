# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



dress = Item.create(name: "Dress", price: 100.00, color: "pink", size: "small", quantity: 10, creator_id: nil)
pants = Item.create(name: "Pants", price: 200.00, color: "purple", size: "medium", quantity: 10, creator_id: nil)
skirt = Item.create(name: "Skirt", price: 400.00, color: "brown", size: "large", quantity: 10, creator_id: nil)
jeans = Item.create(name: "Jeans", price: 300.00, color: "sky blue", size: "large", quantity: 10, creator_id: nil)
t_shirt = Item.create(name: "T-shirt", price: 600.00, color: "blue", size: "M", quantity: 10, creator_id: nil)
suite = Item.create(name: "Suite", price: 200.00, color: "red", size: "S", quantity: 10, creator_id: nil)
sweats = Item.create(name: "Sweats", price: 120.00, color: "pink", size: "S", quantity: 10, creator_id: nil)
crop_top = Item.create(name: "Crop Top", price: 210.00, color: "white", size: "M", quantity: 10, creator_id: nil)
button_up = Item.create(name: "Button up", price: 310.00, color: "green", size: "S", quantity: 10, creator_id: nil)
ost = Item.create(name: "Over sized T-shirt", price: 110.00, color: "yellow", size: "M", quantity: 10, creator_id: nil)
leggings = Item.create(name: "Leggings", price: 190.00, color: "black", size: "XL", quantity: 10, creator_id: nil)



women = Category.create(name: "Women")
men = Category.create(name: "Men")

CategoryItem.create(item_id: dress.id, category_id: women.id)
CategoryItem.create(item_id: pants.id, category_id: men.id)
CategoryItem.create(item_id: skirt.id, category_id: women.id)
CategoryItem.create(item_id: jeans.id, category_id: women.id)
CategoryItem.create(item_id: t_shirt.id, category_id: men.id)
CategoryItem.create(item_id: suite.id, category_id: men.id)
CategoryItem.create(item_id: sweats.id, category_id: men.id)
CategoryItem.create(item_id: crop_top.id, category_id: women.id)
CategoryItem.create(item_id: button_up.id, category_id: men.id)
CategoryItem.create(item_id: ost.id, category_id: women.id)
CategoryItem.create(item_id: leggings.id, category_id: women.id)