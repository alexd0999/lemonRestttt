//
//  LoginView.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25
//

import SwiftUI

struct LoginView: View {
    @Binding var userName:String
    @Binding var isLoggedIn:Bool

    var body: some View {
        VStack {
            Image("littleLemon")
                .resizable()
                .scaledToFit()
                .frame(height:100)

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

#Preview {
    LoginView(
        userName: .constant(""),
        isLoggedIn: .constant(false)
    )
}
