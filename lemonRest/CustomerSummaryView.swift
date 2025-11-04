//
//  CustomerSummaryView.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25


import SwiftUI

struct CustomerSummaryView: View {
    @State private var customer = Customer(
        name: "Alex",
        email: "alex.dyous@sdgku.edu",
        isLoyaltyMember: true
    )
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
            
            //Customer Details
            VStack(alignment: .leading, spacing: 5) {
                Text("**Name:** \(customer.name)")
                Text("**Email:** \(customer.email)")
                
                if customer.isLoyaltyMember {
                    HStack {
                        Text("⭐️ **Loyalty Member**")
                            .bold()
                            .foregroundColor(.orange)
                        
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.orange)
                    }
                    .padding(.top, 5)
                }
            }
            .font(.title3)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            //Toggle loyalty status
            Toggle("Is a Loyalty Member", isOn: $customer.isLoyaltyMember)
                .padding()
                .background(customer.isLoyaltyMember ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                .cornerRadius(10)
                
            Spacer()
        }
        .padding()
        .navigationTitle("Customer Profile")
    }
}

#Preview {
    CustomerSummaryView()
}
