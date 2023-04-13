//
//  ActivityInfoView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 13.04.2023.
//

import SwiftUI

struct ActivityInfoView: View {
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("Ce este MET?")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                Text("„Echivalentul metabolic” (notat MET) e o masura a consumului energetic ce ne permite sa comparam activitati diferite intre persoane diferite. MET-ul e un multiplu al Ratei Metabolice de Baza per ora. \r\n\n1 MET reprezinta caloriile arse prin rata metabolica de baza, iar toate activitatile sunt un multiplu al acesteia. Somnul e singurul ce consuma mai putin (0.9 MET) iar pe masura ce intensitatea creste se poate ajunge chiar si la 23 MET. \r\n\nFormula simpla: Caloriile arse de o activitate intr-o ora = MET specific activitatii x Greutatea ta corporala \r\n\nFormula mai precisa: Caloriile arse de o activitate intr-o ora = MET specific activitatii x Rata Metabolica de Baza / 24")
            }
            .card()
        }
    }
}

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
