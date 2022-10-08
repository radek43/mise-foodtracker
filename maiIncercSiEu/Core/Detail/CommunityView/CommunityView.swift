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
                VStack {
                    ScrollView{
                        //Titlu
                        VStack {
                            HStack {
                                Text("Comunitate")
                                    .font(.largeTitle.bold())

                                Spacer()

                                NavigationLink {
                                    CommunityAddMessage()
                                } label: {
                                    Image(systemName: "plus.bubble")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                        .frame(width: 48, height: 48)
                                    }
                                }
                            }
                            .padding([.top, .leading, .trailing], 25.0)

                        
                        VStack {
                            NavigationLink(destination: CommunityViewDetail()){
                                CommunityCard()
                            }
                            CommunityCard()
                            CommunityCard()
                            CommunityCard()
                            CommunityCard()
                            CommunityCard()
                                .padding(.bottom, 5.0)
                        }
                    }
                }
            }
            .navigationTitle("Comunitate")
            .navigationBarHidden(true)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
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
