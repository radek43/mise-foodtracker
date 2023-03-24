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
        .frame(maxWidth: 612)
        .modifier(MakeCard())
        .padding(.horizontal)
    }
}

// MARK: - PREVIEWS
struct ActivityProgressRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
            ActivityProgressRow(progressTitle: "Greutate Medie", progressValue: "76.90", measurementUnit: "kg")
                .preferredColorScheme(.dark)
        }
    }
}
