import SwiftUI

struct AboutView: View {
    var body: some View {

        VStack {
            Text("Welcome to Little Lemon!")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationTitle("About Us")
    }
}

#Preview {
    AboutView()
}
