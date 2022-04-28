//
//  AddFoodView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/28/22.
//

import SwiftUI

struct AddFoodView: View {
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    let countries = ["Pateu", "Senvis", "Paine cu ou", "Cereale cu lapte", "Omleta", "Cremvusti", "Salata", "Cafelusa"]
    
    @State private var searchString = ""
    
    var body: some View {
              List {
                  
                ForEach(searchString == "" ? countries: countries.filter { $0.contains(searchString)}, id: \.self) { country in
                      Text(country)
                  }
                  
              }
            .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always))
            .shadow(color: Color.black.opacity(0.2), radius: 25, x: 0, y: 10)
            
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
