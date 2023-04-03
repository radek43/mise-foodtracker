//
//  FitnessViewDetail.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 9/4/22.
//

import SwiftUI

struct FitnessDetailView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10.0) {
                ZStack {
                    Rectangle()
                        .fill(Color(.gray))
                        .aspectRatio(4/3, contentMode: .fit)
                    
                    Image("exercitiu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .layoutPriority(-1)
                }
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                .padding()
                .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 10)

                Text("Fandari Bulgaresti")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Divider()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }.padding([.top, .leading, .trailing])
        }
        .toolbar {
            Button {
                print("exercitiu inregistrat la jurnal")
            } label: {
                HStack {
                    Text("Adauga la jurnal")
                    Image(systemName: "text.badge.plus")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background.edgesIgnoringSafeArea(.all))
    }
}


// MARK: - PREVIEW
struct FitnessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                FitnessDetailView()
            }
            NavigationView {
                FitnessDetailView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
