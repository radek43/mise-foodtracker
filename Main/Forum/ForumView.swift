//
//  ForumView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct ForumView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel = ForumViewModel()
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Menu {
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
                            Image("figure.run")
                        }
                    } label: {
                         Text("Sorteaza")
                         Image(systemName: "chevron.down")
                    }
                }.padding(.horizontal)
                
                ForEach(viewModel.posts) { post in
                    NavigationLink(destination: PostDetail(post: post)){
                       PostRow(post: post)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                   }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddNewPost()
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink {
                    //
                } label: {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
        .navigationTitle("Comunitate")
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

// MARK: - PREVIEW
struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
