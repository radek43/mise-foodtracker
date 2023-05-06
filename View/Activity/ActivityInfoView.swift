//
//  ActivityInfoView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 13.04.2023.
//

import SwiftUI

struct ActivityInfoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    HStack {
                        Text("Ce este MET?")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark.circle")
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
                    
                    VStack {
                        Text("„Echivalentul metabolic” (notat MET) e o masura a consumului energetic ce ne permite sa comparam activitati diferite intre persoane diferite. MET-ul e un multiplu al Ratei Metabolice de Baza per ora.")
                            .font(.body)
                            .fontWeight(.regular)
                            .card()
                        Text("MET reprezinta caloriile arse prin rata metabolica de baza, iar toate activitatile sunt un multiplu al acesteia. Somnul e singurul ce consuma mai putin (0.9 MET) iar pe masura ce intensitatea creste se poate ajunge chiar si la 23 MET.")
                            .font(.body)
                            .fontWeight(.regular)
                            .card()
                        Text("Formula simpla: Caloriile arse de o activitate intr-o ora = MET specific activitatii x Greutatea ta corporala \r\n\nFormula mai precisa: Caloriile arse de o activitate intr-o ora = MET specific activitatii x Rata Metabolica de Baza / 24 \r\n\nPentru a calcula in minute, pur si simplu imparti rezultatul la 60 (de minute intr-o ora) si inmultesti cu numarul de minute.")
                            .font(.body)
                            .fontWeight(.regular)
                            .card()
                    }
                    Spacer()
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct ActivityInfoView_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    ActivityInfoView()
                }
                ZStack {
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    ActivityInfoView()
                }
                .preferredColorScheme(.dark)
            }
    }
}
