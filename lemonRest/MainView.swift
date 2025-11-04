


//
//  MainView.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25
//

import SwiftUI

struct MainView: View {
    @State private var uName = ""
    @State private var isLoggedIn = true

    var body: some View {
        NavigationStack {
            if isLoggedIn == true {
                VStack(spacing: 20) {
                    Text("Welcome \(uName)")
                        .font(.title)
                        .bold()
                    
                    Image("littleLemon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    NavigationLink("Make a reservation",
                       destination:ReservationForm())
                    
                    NavigationLink("Our Menu",
                       destination: MenuView())

                    NavigationLink("Customer Profile",
                       destination: CustomerSummaryView())
                    
                    NavigationLink("About us",
                       destination:AboutView())
                    
                    Button("Logout") {
                        isLoggedIn = false
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                }
                .padding()
            } else {
                LoginView(userName:$uName,isLoggedIn:$isLoggedIn)
            }
        }
    }
}

#Preview {
    MainView()
}
