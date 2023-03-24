//
//  DishView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 1/10/23.
//

import SwiftUI

struct DishView: View {
    @State var searchText = ""  // de modificat
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        SearchBar(placeholderText: "Ce ai mancat azi?", text: $searchText)
                            .padding([.top, .leading, .trailing])
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
                        .modifier(MakeCard())
                        .padding(.horizontal)
                        
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
                        .modifier(MakeCard())
                        .padding(.horizontal)
                        Spacer()
                    }
                }
                
            }
            .navigationBarTitle("Adauga un fel de mancare", displayMode: .inline)
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DishView()
            DishView()
                .preferredColorScheme(.dark)
        }
    }
}
