//
//  NoInternetView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 23.05.2023.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Image(systemName: "wifi.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color.accent)
                Text("Aplicația nu are acces la internet sau nu poate comunica cu serverul. \nTe rugăm să verifici conexiunea la internet.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
            .card()
        }
    }
}

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoInternetView()
            NoInternetView()
                .preferredColorScheme(.dark)
        }
    }
}
