//
//  MenuView.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25.
//

import SwiftUI

struct MenuView: View {
    
    //State variables for toggles
    @State private var showPremium = false
    @State private var showDessert = false
    @State private var showThankYou = false
    
    //Menu items dictionary
    let menuItemsImproved  = [
        MenuItem(name: "Pizza", description: "Cheesy and hot", price: 9.0),
        MenuItem(name: "Steak", description: "Grilled to perfection", price: 15.0),
        MenuItem(name: "Pasta", description: "Spaguetti", price: 6.0),
        MenuItem(name: "Caesar Salad", description:"Romaine lettuce with cremy Caesar dreesing", price: 10.99),
        MenuItem(name: "Soup", description: "Warm and comforting", price: 4.75),
        MenuItem(name: "Burger", description: "Grilled beef with cheese", price: 11.00),
        MenuItem(name: "Fish Tacos", description: "Crispy fish with spicy mayo", price: 10.25)
    ]
    
    //Computed property for sorting
    var sortedMenu: [MenuItem] {
        menuItemsImproved.sorted { $0.name < $1.name }
    }
    
    //Computed property for filtering
    var filteredMenu: [MenuItem] {
        let menu = sortedMenu
        return showPremium ? menu.filter{ $0.price >= 10 } : menu
    }
    
    var visiblePremiumCount: Int {
        filteredMenu.filter { $0.price >= 10 }.count
    }
    
    var visibleRegularCount: Int {
        filteredMenu.filter { $0.price < 10 }.count
    }
    
    var visibleTotalPrice: Double {
        filteredMenu.map { $0.price }.reduce(0, +)
    }
    
    //The main view body
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "fork.knife")
                    .foregroundColor(.orange)
                    .font(.system(size: 32))
                Text("Today's menu")
                    .font(.title)
                    .bold()
            }
            
            VStack{
                Toggle("Show only premium", isOn: $showPremium)
                    .padding()
                
                if showPremium {
                    Text("You will display premium")
                        .font(.title3)
                        .foregroundColor(.green)
                }
                
                //Homework Task 1: Thank You Toggle
                Toggle("Show Thank You Message", isOn: $showThankYou)
                    .padding(.horizontal)
                
                if showThankYou {
                    Text("Thanks for visiting Little Lemon!")
                        .italic()
                        .foregroundColor(.blue)
                        .padding(.bottom)
                }
                
            }
            
            //Button to show DessertView
            Button("View Desserts"){
                showDessert.toggle()
            }
            .foregroundColor(.black)
            .padding()
            .background(Color.green.opacity(0.3))
            .cornerRadius(10)
            .sheet(isPresented:$showDessert){
                DessertView()
            }
            
            List {
                Section(header: Text("Showing \(filteredMenu.count) items")) {
                    ForEach(filteredMenu, id: \.name) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .bold()
                                
                                Text(item.description)
                                    .font(.caption)
                                
                                Text("$ \(item.price, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            //"Premium" badge
                            if item.price > 10 {
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("Premium")
                                        .font(.caption)
                                }
                                .font(.caption)
                                .foregroundColor(.orange)
                                .padding(5)
                                .background(Color.orange.opacity(0.1))
                                .cornerRadius(8)
                            }
                        
                            if item.price < 7 {
                                HStack {
                                    Image(systemName: "dollarsign.circle.fill")
                                    Text("Value")
                                        .font(.caption)
                                }
                                .font(.caption)
                                .foregroundColor(.green)
                                .padding(5)
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                
                Text("Premium: \(visiblePremiumCount) | Regular: \(visibleRegularCount) | Total: $\(visibleTotalPrice, specifier: "%.2f")")
                    .font(.subheadline)
                    .padding()
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(18)
            }
        }
    }
}

#Preview {
    MenuView()
}
