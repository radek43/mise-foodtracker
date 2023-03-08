//
//  ForumView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/10/22.
//

import SwiftUI

struct ForumView: View {
    // MARK: - PROPERTIES

//    @ObservedObject var viewModel = ForumViewModel()
    var posts: [Post] = Post.dummyData
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBackground")
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
                                Image("figure.run")
                            }
                        } label: {
                             Text("Sorteaza")
                             Image(systemName: "chevron.down")
                        }
                    }
                    .frame(maxWidth: 612)
                    .padding(.horizontal)
                    
                    ForEach(posts) { post in
                        NavigationLink(destination: PostDetail(post: post)){
                           PostRow(post: post)
                                .frame(maxWidth: 612)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                       }
                    }

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
}

// MARK: - PREVIEW
struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForumView()
        }
    }
}
