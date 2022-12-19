//
//  AddNewPost.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/8/22.
//

import SwiftUI
import Kingfisher

struct AddNewPost: View {
    // MARK: - PROPERTIES
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State private var titluPostare = ""
    @State private var descriere = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = ForumViewModel()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Titlu postare:")) {
                    TextField("", text: $titluPostare)
                }
                Section(header: Text("Descriere:")) {
                    TextEditor(text: $descriere)
                        .frame(height: 200)
                }
                Section(header: Text("Imagine:")) {
                    Button {
                        showImagePicker.toggle()
                        print("buton de ales imagine apasat")
                    } label: {
                        if let profileImage = profileImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
                            profileImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            Text("Adauga o imagine")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                }
            }
        }
        .onReceive(viewModel.$didUploadPost, perform: { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .navigationBarTitle("Postare Noua", displayMode: .inline)
        .toolbar {
            Button("Posteaza") {
                print("Buton postare apasat")
            }
            //                Button("Trimite") {
            //                    viewModel.uploadPost(withTitle: titluPostare, withContent: descriere)
            //                    viewModel.uploadProfileImage(selectedImage)
            //                }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

// MARK: - PREVIEW
struct CommunityAddMessage_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPost()
            .environmentObject(AuthViewModel())
    }
}
