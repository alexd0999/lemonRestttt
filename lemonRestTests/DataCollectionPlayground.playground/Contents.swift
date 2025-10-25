import UIKit

//ARRAYS

//Create an array of strings

let dishes = ["pizza", "pasta", "tacos"]
              
let premiumDish1 = "gnocchi"

//to access use the index
              print(dishes[0])
              print(dishes[1])

var orders = [String]() //creating an array
orders.append("soup") //add item
orders.append("Burger") //add item
print(orders.count)

//DICTIONARIES KEY:VALUE pairs
//Define a dictionary with prices
let menuPrices:[String:Double] =
["Pizza":12.99,"Salad":13.80, "Pasta":9.50]
print(menuPrices["Salad"]!) //Optional(13.80)

let drinkPrices:[String:Double] =
["Agua":5.99,"Cerveza":3.99, "Vino":2.50]
print(drinkPrices["Cerveza"]!) 

