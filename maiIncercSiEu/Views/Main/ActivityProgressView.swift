//
//  ActivityProgressView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/21/22.
//

import SwiftUI

struct ActivityProgressView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Text("nimic (deocamdata)")
                    .navigationTitle("Progres")
            }
        
        }.navigationViewStyle(.stack)
    }
}

struct ActivityProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityProgressView()
    }
}
