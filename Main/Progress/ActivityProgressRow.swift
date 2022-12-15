//
//  ActivityProgressRow.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct ActivityProgressRow: View {
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
        .frame(maxWidth: .infinity)
        .modifier(MakeCard())
    }
}

// MARK: - PREVIEWS
struct CardMicut_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
    }
}
