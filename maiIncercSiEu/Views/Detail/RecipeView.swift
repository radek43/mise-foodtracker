//
//  RecipeView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/16/22.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        ScrollView{
            Image("foodImage")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                //.background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
                .padding()
            VStack(spacing: 30) {
                Text("Souvlaki Grecesc")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 30){
                    Text("Descriere:")
                        .font(.headline)
                    Text("Souvlaki , preparat  greceasc, foarte popular, este o reteta de frigarui cu legume sau fara, servite cu sos tzatziki alaturi. Carnea din care sunt preparate frigaruile poate fi de porc, pui sau miel. Eu totdeauna prefer sa le pregatesc cu legume. Savoarea cepei, rosiei sau ardeiului facut pe gratar sunt de neegalat. De obicei, tai castravetele din tzatziki mai grosier tocmai ca sa contrabalaseze legumele inmuiate pe foc si moliciunea fina si aromata a ardeiului kapia.  Ca orice reteta greceasca autentica, isi bazeaza savoarea pe ingrediente simple si aromate si pe combinatii de culori si arome cu adevarat inspirate.")
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("Ingrediente:")
                            .font(.headline)
                        Text("1 kg. pui fara piele si dezosat – de obicei se recomanda piept de pui – eu prefer copanele pe care le-am dezosat si curatat de piele, dupa care lea-m portionat in bucati mici de 2,5 cm")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        //.ignoresSafeArea(.container, edges: .top)
        

    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
