//
//  ReservationForm.swift
//  lemonRest
//
//  Created by Alex Arthur on 10/23/25.
//

import SwiftUI

struct ReservationForm: View {
    @State private var userName:String = ""
    @State private var guestNumber:Int = 1
    @State private var reservationDate = Date()
    @State private var allergiesNotes = ""
    @State private var showSummary = false
    
    @State private var isDateInvalid = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Reservation details")) {
                        //view
                        TextField("Insert name: ", text: $userName)
                            .padding(2)
                            .font(.system(size:18, weight: .medium))
                        //validation
                        if userName.isEmpty {
                            Text("Please enter a name")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                        //view
                        Stepper("Guest: \(guestNumber)", value:
                                     $guestNumber, in: 1...10)
                            .padding(2)
                            
                            // validation
                            if guestNumber > 8 {
                                Text("For parties larger than 8, we will call to confirm")
                                    .font(.caption)
                                    .foregroundColor(.red)
                            } else if guestNumber >= 6 { 
                                Text("For large parties, please arrive 10 minutes early")
                                    .font(.caption)
                                    .foregroundColor(.orange)
                            }
                            
                            //view
                        DatePicker("Date", selection: $reservationDate, displayedComponents: [.date, .hourAndMinute])
                            .onChange(of: reservationDate) {
                                    isDateInvalid = reservationDate < Date()
                                }
                                
                                if isDateInvalid {
                                    Text("Please select a valid date")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                                
                            }
                    
                        TextField("Allergies notes", text: $allergiesNotes)
                        
                        Button("Confirm Reservation") {
                            showSummary = true
                        }
                        .disabled(userName.isEmpty || isDateInvalid)
                        .navigationDestination(isPresented:$showSummary){
                            ReservationSummaryView(
                                name:$userName,
                                guest:$guestNumber,
                                allergiesNotes:$allergiesNotes,
                                date:$reservationDate)
                            
                        }
                    }
                }
            }
        }
    }

    #Preview {
        ReservationForm()
    }
