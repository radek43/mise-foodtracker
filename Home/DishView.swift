//
//  DishView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct DishView: View {
    // MARK: - PROPERTIES
    @State private var searchText = ""  // de modificat
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        SearchBar(placeholderText: "Ce ai mancat azi?", text: $searchText)
                            .frame(maxWidth: 580)
                            .padding([.top, .leading, .trailing])
                        
                        // RECENT LOGGED FOODS
                        VStack {
                            Text("Adaugate astazi")
                                .font(.headline)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Paine cu ou")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "checkmark")
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Cereale cu lapte")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "checkmark")
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Biscuiti Ovaz")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "checkmark")
                            }
                        }
                        .card()
                        .padding(.horizontal)
                        
                        // FOOD HISTORY
                        VStack {
                            Text("Istoric meniuri servite")
                                .font(.headline)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Ochiuri de oua")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "plus")
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Sunca")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "plus")
                            }
                            Divider()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Cafea cu lapte")
                                    Text("1 felie, 517 calorii")
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "plus")
                            }
                        }
                        .card()
                        .padding(.horizontal)
                        Spacer()
                    } //: END VSTACK
                } //: END SCROLL VIEW
            } //: END ZSTACK
            .navigationBarTitle("Adauga un fel de mancare", displayMode: .inline)
        } //: END NAVIGATION VIEW
    }
}


// MARK: - PREVIEWS
struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DishView()
            DishView()
                .preferredColorScheme(.dark)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
