//
//  ProgressRow.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 07.05.2022.
//

import SwiftUI


struct ProgressRow: View {
    // MARK: - PROPERTIES
    var progressTitle: String
    var progressValue: String
    var measurementUnit: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(progressTitle)
            Spacer()
            Text("\(progressValue) \(measurementUnit)")
        }
        .card()
    }
}

// MARK: - PREVIEWS
struct ProgressRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                ProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
            }
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                ProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                    .preferredColorScheme(.dark)
            }
        }
    }
}
