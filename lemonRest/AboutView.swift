


import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Little Lemon!")
                    .font(.title)
                    .padding()
                
                Image("littleLemon") // Make sure this matches your asset name!
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Spacer() // Pushes content to the top
            }
            .navigationTitle("About Us")
        }
    }
}

#Preview {
    AboutView()
}
