//
//  CommunityView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct CommunityView: View {
    
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    Title(numeTitlu: "Comunitate")
                        
                }
                .navigationTitle("Comunitate")
                .navigationBarHidden(true)
                .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            }
        
        }
        .modifier(BlurSafeArea())
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
