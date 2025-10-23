


import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Little Lemon!")
                    .font(.title)
                    .padding()
                
                Image("littleLemon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Spacer()
            }
            .navigationTitle("About Us")
        }
    }
}

#Preview {
    AboutView()
}
