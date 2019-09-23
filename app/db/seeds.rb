require('pry-byebug')

require_relative("../models/customer.rb")
require_relative("../models/stock_item.rb")
require_relative("../models/rental.rb")


Rental.delete_all()
Customer.delete_all()
StockItem.delete_all()

customer1 = Customer.new({
  "name" => "David Small",
  "address" => "29 Smith Street, Largs",
  "dob" => "12/09/98" })
customer1.save()

customer2 = Customer.new({
  "name" => "Mike Sweetmore",
  "address" => "1 Hay Place, Irvine",
  "dob" => "19/11/89"})
customer2.save()

customer3 = Customer.new({
  "name" => "Dudley Hayden",
  "address" => "88 Limerick Road, Dublin",
  "dob" => "12/07/29"})
customer3.save()

customer4 = Customer.new({
  "name" => "Kevin Sutherland",
  "address" => "3 Marina Quay, Lossiemouth",
  "dob" => "01/01/01"})
customer4.save()


stock1 = StockItem.new({
  "name" => "Core GTS 5",
  "category" => "Kite",
  "size" => "9m"
  })
stock1.save()

stock2 = StockItem.new({
  "name" => "Core GTS 5",
  "category" => "Kite",
  "size" => "7m"
  })
stock2.save()

stock3 = StockItem.new({
  "name" => "Core GTS 5",
  "category" => "Kite",
  "size" => "11m"
  })
stock3.save()

stock4 = StockItem.new({
  "name" => "Crazyfly Raptor",
  "category" => "Twin-Tip Board",
  "size" => "128cm"
  })
stock4.save()

stock5 = StockItem.new({
  "name" => "Naish Team Edition",
  "category" => "Twin-Tip Board",
  "size" => "142cm"
  })
stock5.save()

stock6 = StockItem.new({
  "name" => "Core Ripper",
  "category" => "Directional",
  "size" => "5/8"
  })
stock6.save()

stock7 = StockItem.new({
  "name" => "Slingshot Screamer",
  "category" => "Directional",
  "size" => "5/5"
  })
stock7.save()

stock8 = StockItem.new({
  "name" => "North Trust Bar",
  "category" => "Bar",
  "size" => "55cm"
  })
stock8.save()

stock9 = StockItem.new({
  "name" => "Core Team Bar",
  "category" => "Bar",
  "size" => "55cm"
  })
stock9.save()

rental1 = Rental.new({
  "customer_id" => customer1.id,
  "stock_item_id" => stock1.id
  })
rental1.save()

rental2 = Rental.new({
    "customer_id" => customer1.id,
    "stock_item_id" => stock4.id
    })
rental2.save()


rental3 = Rental.new({
      "customer_id" => customer1.id,
      "stock_item_id" => stock8.id
      })
rental3.save()


rental4 = Rental.new({
        "customer_id" => customer4.id,
        "stock_item_id" => stock7.id
        })
rental4.save()
binding.pry
nil
