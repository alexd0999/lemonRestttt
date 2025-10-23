//
//  ReservationSummaryView.swift
//  lemonRest
//
//  Created by Alex Arthur on 10/23/25.
//

import SwiftUI

struct ReservationSummaryView: View {
    @Binding var name:String
    @Binding var guest:Int
    @Binding var allergiesNotes:String
    @Binding var date:Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Reservation Summary").font(.title)
            
            //adding information
            Text("Name: \(name)")
            Text("Guests: \(guest)")
            Text("Allergies: \(allergiesNotes)")
            Text("Date: \(formattedDate(date:date))")
            
        VStack(alignment: .leading, spacing: 25) {
                       Text("Reservation Confirmed!")
                           .font(.largeTitle)
                           .bold()

                       Text("Thank you, \(name), your reservation is confirmed for \(guest) people.")
                           .font(.title3)

                       if !allergiesNotes.isEmpty {
                           Text("Note: We will accommodate the following allergies: \(allergiesNotes)")
                               .font(.headline)
                       }
                       
                       Text("Date & Time: \(formattedDate(date: date))")
                           .font(.headline)
                       
                       Spacer()
                   }
                   .padding()
                   .navigationTitle("Summary")
               }
        }
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
        
    }

#Preview {
    ReservationSummaryView(
        name: .constant("Sample Name"),
        guest: .constant(2),
        allergiesNotes: .constant("None"),
        date: .constant(Date())
    )
}
