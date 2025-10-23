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
        VStack(alignment: .leading, spacing: 10) {
            Text("Reservation Summary").font(.title)
            
            //adding information
            Text("Name: \(name)")
            Text("Guests: \(guest)")
            Text("Allergies: \(allergiesNotes)")
            Text("Date: \(formattedDate(date:date))")
            
        }
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
        
    }
}

#Preview {
    ReservationSummaryView(
        name: .constant("Sample Name"),
        guest: .constant(2),
        allergiesNotes: .constant("None"),
        date: .constant(Date())
    )
}
