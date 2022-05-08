//
//  AddFoodView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 4/28/22.
//

import SwiftUI

extension UIApplication {
    /// Resigns the keyboard.
    ///
    /// Used for resigning the keyboard when pressing the cancel button in a searchbar based on [this](https://stackoverflow.com/a/58473985/3687284) solution.
    /// - Parameter force: set true to resign the keyboard.
    func endEditing(_ force: Bool) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(force)
    }
}
    
struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
    
extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

struct AddFoodView: View {
    init() { UITableView.appearance().backgroundColor = UIColor.clear }
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    
    var body: some View {
        NavigationView {
             VStack {
                 // Search view
                 HStack {
                     HStack {
                         Image(systemName: "magnifyingglass")
                         
                         TextField("search", text: $searchText, onEditingChanged: { isEditing in
                             self.showCancelButton = true
                         }, onCommit: {
                             print("onCommit")
                         }).foregroundColor(.primary)
                         
                         Button(action: {
                             self.searchText = ""
                         }) {
                             Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                         }
                     }
                     .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                     .foregroundColor(.secondary)
                     .background(Color(.secondarySystemBackground))
                     .cornerRadius(10.0)
                     
                     if showCancelButton  {
                         Button("Cancel") {
                                 UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                 self.searchText = ""
                                 self.showCancelButton = false
                         }
                         .foregroundColor(Color(.systemBlue))
                     }
                 }
                 .padding([.top, .leading, .trailing])
                 .navigationBarHidden(showCancelButton) //.animation(.default) // animation does not work properly

                 List {
                     // Filtered list of names
                     ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                         searchText in Text(searchText)
                     }
                 }
                 .navigationBarTitle(Text("Search"), displayMode: .inline)
                 .navigationBarItems(trailing: Button(action: {
                                    print("Dismissing sheet view...")
                                }) {
                                    Text("Done").bold()
                                })
                 
                 
                 .resignKeyboardOnDragGesture()
             }
         }
     }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
