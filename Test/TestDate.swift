//
//  TestDate.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.05.2023.
//
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
}

struct TestDate: View {
    @State private var selectedDate = Date()
    let events = [
        Event(name: "Birthday party", date: Date()),
        Event(name: "Anniversary", date: Date().addingTimeInterval(60 * 60 * 24 * 365)),
        Event(name: "Meeting", date: Date().addingTimeInterval(60 * 60 * 24 * 7))
    ]
    
    var filteredEvents: [Event] {
        events.filter { Calendar.current.compare($0.date, to: selectedDate, toGranularity: .day) == .orderedSame }
    }
    
    var body: some View {
        VStack {
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .padding()
            
            List(filteredEvents) { event in
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.headline)
                    Text("\(event.date)")
                        .font(.subheadline)
                }
            }
        }
    }
}

struct TestDate_Previews: PreviewProvider {
    static var previews: some View {
        TestDate()
    }
}
