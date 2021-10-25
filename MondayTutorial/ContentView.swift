//
//  ContentView.swift
//  MondayTutorial
//
//  Created by Federico on 23/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var currentTime = Date()
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    
    func formatDate() -> String {
        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: currentTime)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return "\(day)-\(month)-\(year) (\(hour):\(minute))"
    }
    
    
    var body: some View {
        Form {
            Section(header:(Text("Date Picker 1"))) {
                DatePicker("Pick a date:", selection: $currentTime) // Normal Date Time Picker
            }
            
            Section(header:(Text("Date Picker 2"))) {
                DatePicker("Pick a future date:", selection: $currentTime, in: Date()...) // Only pick a future date
            }
            
            Section(header:(Text("Date Picker 3"))) {
                DatePicker("Pick a past date:", selection: $currentTime, in: closedRange...Date(), displayedComponents: .date) // Only pick a past date
            }
            
            Section(header:(Text("Date Picker 4"))) {
                DatePicker("Pick a time:", selection: $currentTime, displayedComponents: .hourAndMinute)
            }
            
            Section(header:(Text("Result"))) {
                Text(formatDate())
            }
            
            //.labelsHidden() - Hides labels
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
