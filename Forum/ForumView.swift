//
//  ForumView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.04.2022.
//

import SwiftUI

struct ForumView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Spacer()
                            Menu { // sorteaza
                                Button {
                                    // do something
                                } label: {
                                    Text("Slabit")
                                    Image(systemName: "arrow.down.right.circle")
                                }
                                Button {
                                    // do something
                                } label: {
                                    Text("Crestere musculara")
                                    Image("dumbbell")
                                }
                                Button {
                                    // do something
                                } label: {
                                    Text("Sfaturi")
                                    Image(systemName: "questionmark.square")
                                }
                                Button {
                                    // do something
                                } label: {
                                    Text("Retete")
                                    Image("book")
                                }
                                Button {
                                    // do something
                                } label: {
                                    Text("Alergare")
                                    Image("sport")
                                }
                            } label: {
                                Text("Sorteaza")
                                Image(systemName: "chevron.down")
                            }
                        }
                        .frame(maxWidth: 580)
                        .padding([.top, .leading, .trailing])
                        .padding(.trailing)
                    }
                }
                .navigationBarItems(
                    leading:
                        NavigationLink {
                            //
                        } label: {
                            Image(systemName: "person.crop.circle")
                        },
                    trailing:
                        NavigationLink {
                            AddNewPost()
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }
                )
                .navigationTitle("Comunitate")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW
struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForumView()
            ForumView()
                .preferredColorScheme(.dark)
            
        }
    }
}
