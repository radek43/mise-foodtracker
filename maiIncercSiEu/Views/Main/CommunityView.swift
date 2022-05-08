//
//  CommunityView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    Title(numeTitlu: "Comunitate")
                        
                }
                .navigationTitle("Comunitate")
                .navigationBarHidden(true)
            }
        
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
