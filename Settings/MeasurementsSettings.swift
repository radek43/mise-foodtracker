//
//  MeasurementsSettings.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/19/22.
//

import SwiftUI
import Combine

struct MeasurementsSettings: View {
    // MARK: - PROPERTIES
    @State private var userWeight = "0"
    @State private var userHeight = "0"
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Form {
                Section(header: Text("Greutate")) {
                    HStack {
                        TextField("Introduceti greutatea dvs.", text: $userWeight)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(userWeight)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.userWeight = filtered
                                        }
                                }
                        Text("kg")
                    }
                }
                Section(header: Text("Inaltime")) {
                    HStack {
                        TextField("Introduceti greutatea dvs.", text: $userWeight)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(userHeight)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.userWeight = filtered
                                        }
                                }
                        Text("cm")
                    }
                }
            }
        }
        .navigationTitle("Masuratori")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Salveaza") {
                print("Buton salvare apasat")
            }
        }
    }
}

// MARK: - PREVIEW
struct MeasurementsSettings_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementsSettings()
    }
}
