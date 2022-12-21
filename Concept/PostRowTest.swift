//
//  PostRowTest.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 12/21/22.
//

import SwiftUI

struct PostRowTest: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Circle() // placeholder poza de profil
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.trailing, 5)
                VStack(alignment: .leading) {

                //placeholder titlu
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .frame(width: 250, height: 30)
                    .foregroundColor(Color("ButtonColor"))
                
                //placeholder username
                    RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 10)
                    .foregroundColor(Color("ButtonColor"))
                
                //placeholder linie1 continutText
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: 250, height: 15)
                    .foregroundColor(Color("ButtonColor"))
                    
                //placeholder linie2 continutText
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: 225, height: 13)
                    .foregroundColor(Color("ButtonColor"))
                }
            }
            
            HStack {
                //placeholder aprecieri
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 80, height: 10)
                    .foregroundColor(Color("ButtonColor"))
                
                //placeholder comentarii
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 80, height: 10)
                    .foregroundColor(Color("ButtonColor"))
                
                Spacer()
                
                //placeholder dataPostare
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 70, height: 10)
                    .foregroundColor(Color("ButtonColor"))
            }
            .foregroundColor(Color.secondary)
            .font(.footnote)
        }
        .modifier(MakeCard())
    }
}

struct PostRowTest_Previews: PreviewProvider {
    static var previews: some View {
        PostRowTest()
    }
}