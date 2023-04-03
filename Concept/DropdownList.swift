//
//  DropdownList.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 12/15/22.
//

import SwiftUI

struct DropdownList: View {
    var body: some View {
        Menu {
            Button {
                // do something
            } label: {
                Text("Linear")
                Image(systemName: "arrow.down.right.circle")
            }
            Button {
                // do something
            } label: {
                Text("Radial")
                Image(systemName: "arrow.up.and.down.circle")
            }
        } label: {
             Text("Style")
             Image(systemName: "tag.circle")
        }
    }
}

struct DropdownList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownList()
    }
}
