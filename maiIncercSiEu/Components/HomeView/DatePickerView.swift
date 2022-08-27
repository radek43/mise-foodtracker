//
//  DatePickerView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/17/22.
//

import SwiftUI

struct DatePickerView: View {
    
    @State private var data = Date()
    
    var body: some View {
        VStack {
            DatePicker("Data:", selection: $data, in: ...Date(), displayedComponents: .date)
        }
        .modifier(MakeCard())
    
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
