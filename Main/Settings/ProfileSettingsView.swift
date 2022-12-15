//
//  ProfileSettingsView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/15/22.
//

import SwiftUI

struct ProfileSettingsView: View {
    
    @State private var selectedGender = "Nu spun"
    @State private var changedName = ""
    let genders = ["Masculin", "Feminim", "Nu spun"]
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Form {
                Section(header: Text("Sex")) {
                    Picker("Sex", selection: $selectedGender) {
                        ForEach(genders, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section(header: Text("Numele tau")) {
                    TextField("", text: $changedName)
                }
                Section(header: Text("Data nasterii")) {
                    TextField("", text: $changedName)
                }
                
            }
        }
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
