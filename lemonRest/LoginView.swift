//
//  LoginView.swift
//  lemonRest
//
//  Created by Alex Arthur on 10/23/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var userName:String
    @Binding var isLoggedIn:Bool

    var body: some View {
        NavigationView {
            VStack {
                Image("littleLemon")
                    .resizable()
                    .scaledToFit()
                    .frame(height:50)

                TextField("Enter your username:", text:$userName)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Login") {
                    if userName == "Alex" {
                        isLoggedIn = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView(
        userName: .constant(""),
        isLoggedIn: .constant(false)
    )
}
