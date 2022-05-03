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
        .padding()
        .background(Color(UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding([.leading, .trailing])
        .shadow(color: Color.black.opacity(0.4), radius: 12)
    
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
