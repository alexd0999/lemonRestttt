//
//  MainView.swift
//  lemonRest
//
//  Created by Alex Arthur on 10/23/25.
//

import SwiftUI

struct MainView: View {
    @State private var userName = ""
    @State private var isLoggedIn = true

    var body: some View {
        NavigationView {
            if isLoggedIn == true {
                VStack {
                    Text("Welcome \(userName)")
                        .font(.title)
                        .bold()
                    
                    NavigationLink("Make a reservation",
                       destination:ReservationForm())
                    
                    NavigationLink("About us", destination:AboutView())
                }
                Button("Logout") {
                    isLoggedIn = false
                }
            } else {
                LoginView(userName:$userName,isLoggedIn:$isLoggedIn)
            }
        }
    }
}

#Preview {
    MainView()
}
