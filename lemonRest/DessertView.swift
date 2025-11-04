//
//  DessertView.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25
//

import SwiftUI

struct DessertView: View {
    
    let dessertItems = [
        "Chocolate": 9.00,
        "Vanilla": 8.50,
        "Cookies": 8.80
    ]
    
    var body: some View {
        Text("Dessert Menu")
        List(dessertItems.sorted(by: <), id: \.key) { (name, price) in
            VStack(alignment: .leading) {
                Text(name)
                    .bold()
                Text("$ \(price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
            }
        }
        
    }
}

#Preview {
    DessertView()
}
