//
//  ActivityDetailConfrim.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.04.2023.
//

import SwiftUI

struct ActivityDetailConfrim: View {
    // MARK: - PROPERTIES
    @State private var activityTime = ""
    @State private var userWeight = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 12) {
                // HEADER
                VStack {
                    HStack {
                        Text("Alergare usoară")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark.circle")
                                .font(.title2)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 40)
                
                // FOOD META
                HStack {
                    Text("Timp efectuat:")
                        .foregroundColor(Color.formText)
                    TextField("", text: $activityTime)
                    Text("minute")
                        .foregroundColor(Color.formText)
                }
                .card()
                HStack {
                    Text("Greutate:")
                        .foregroundColor(Color.formText)
                    TextField("", text: $userWeight)
                    Text("kg")
                        .foregroundColor(Color.formText)
                }
                .card()
                
                HStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Image(systemName: "cylinder.split.1x2")
                            .font(Font.largeTitle.weight(.regular))
                            .imageScale(.large)
                            .foregroundColor(Color.accent)
                            
                        VStack(alignment: .leading) {
                            Text("Valoare MET")
                                .font(.headline)
                            Text("6.0")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.card)
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding(.leading)
                    HStack(alignment: .center) {
                        Image(systemName: "stopwatch")
                            .font(Font.largeTitle.weight(.regular))
                            .imageScale(.large)
                            .foregroundColor(Color.accent)
                        VStack(alignment: .leading) {
                            Text("Timp MET")
                                .font(.headline)
                            Text("18.0")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.card)
                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                    .padding(.trailing)
                }
                
                HStack(alignment: .center) {
                    HStack {
                        Image(systemName: "flame")
                            .font(Font.largeTitle.weight(.regular))
                            .imageScale(.large)
                            .foregroundColor(Color.accent)
                        VStack(alignment: .leading) {
                            Text("Calorii arse")
                                .font(.title2)
                            Text("246 kCal")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .card()
                // FOOD CHART
                
                
                // ADD TO JOURNAL
                Button {
                    // viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Adaugă la jurnal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.accent)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: Color.black.opacity(0.1), radius: 12)
                
                Spacer()
            } //: END MAIN VSTACK
            .frame(maxWidth: 580)
            .navigationBarTitle("Detalii Servire", displayMode: .inline)
        } //: END ZSTACK
    }
}

struct ActivityDetailConfrim_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityDetailConfrim()
            ActivityDetailConfrim()
                .preferredColorScheme(.dark)
        }
    }
}
