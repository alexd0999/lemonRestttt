//
//  MenuView.swift
//  lemonRest
//
//  Created by Alex Arthur on 10/23/25.
//

import SwiftUI

struct MenuView: View {
    @State private var showMessage = false
    let menuItems = [
        "Pizza":9.99,
        "Pasta":8.50,
        "Salad":12.20
    ]
    
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
                Toggle("Show an special text", isOn:
                        $showMessage)
                .padding()
                
                if showMessage {
                    Text("You will display this text")
                        .font(.title3)
                        .foregroundColor(.green)
                }
            }
            
            List {
                         ForEach(menuItems.sorted(by: { $0.key > $1.key }), id:\.key) {
                             (name,price) in
                             
                             // Group all views for one item in a VStack
                             VStack(alignment: .leading, spacing: 5) {
                                 Text(name)
                                     .bold()
                                 Text("$ \(price, specifier: "%.2f")")
                                     .foregroundColor(.secondary)
                                 
                             
                                 if price > 10 {
                                     HStack{
                                         Image(systemName: "star")
                                         Text ("Premium")
                                             .font(.caption)
                                     }
                                     .font(.caption)
                                     .foregroundColor(.orange)
                                     .padding(5) //
                                     .background(Color.orange.opacity(0.1))
                                     .cornerRadius(5)
                                 }
                             }
                             .padding(.vertical, 5)
                         }
                     }
        }
    }
}

