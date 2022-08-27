//
//  DatePickerView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/17/22.
//

import SwiftUI

struct DatePickerView: View {
    
    // MARK: - PROPERTIES
    
    @State private var data = Date()
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
        }
        .modifier(MakeCard())
    
    }
}

// MARK: - PREVIEW

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
