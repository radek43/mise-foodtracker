//
//  CommunityAddMessage.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/8/22.
//

import SwiftUI

struct CommunityAddMessage: View {
    
    // MARK: - PROPERTIES
    
    @State private var titluPostare = ""
    @State private var descriere = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.secondary)
                    .padding(.trailing, 5)
                VStack {
                    HStack {
                        Text("Titlu:")
                        Spacer()
                    }
                    TextField("", text: $titluPostare)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        Text("Descriere:")
                        Spacer()
                    }
                    TextEditor(text: $descriere)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary).opacity(0.15))
                }
            }
            .toolbar {
                Button("Trimite") {
                    print("Postare trimisa")
                }
            }
        }
        .padding()
        .navigationBarTitle("Postare Noua", displayMode: .inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
    
}

// MARK: - PREVIEW
struct CommunityAddMessage_Previews: PreviewProvider {
    static var previews: some View {
        CommunityAddMessage()
    }
}
