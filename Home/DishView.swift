//
//  DishView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10.01.2023.
//

import SwiftUI

struct DishView: View {
    // MARK: - PROPERTIES
    @State private var searchText = ""
    
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
                        
                        // Recent logged items
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
                        
                        // Item history
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
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Adaugă un fel de mancare", displayMode: .inline)
        }
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
