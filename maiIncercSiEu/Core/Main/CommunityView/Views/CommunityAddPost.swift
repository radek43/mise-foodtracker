//
//  CommunityAddMessage.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 10/8/22.
//

import SwiftUI
import Kingfisher

struct CommunityAddPost: View {
    
    // MARK: - PROPERTIES
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State private var titluPostare = ""
    @State private var descriere = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = CommunityViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 5)
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.secondary)
                        .padding(.trailing, 5)
                }
                VStack {
                    HStack {
                        Text("Titlu:")
                        Spacer()
                    }
                    HStack {
                        TextField("", text: $titluPostare)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack {
                        Text("Descriere:")
                        Spacer()
                    }
                    TextEditor(text: $descriere)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary).opacity(0.15))
                    Button {
                        showImagePicker.toggle()
                        print("buton de ales imagine apasat")
                    } label: {
                        if let profileImage = profileImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
                            profileImage
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .frame(height: 200)
                                .foregroundColor(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.secondary)
                                            .opacity(0.15))
                                .overlay(
                                    VStack {
                                            Image("addPhotoOutline")
                                                .resizable()
                                                .frame(width: 112, height: 100)
                                                .foregroundColor(Color.secondary)
                                    
                                            Text("Adaugă o imagine")
                                                .foregroundColor(Color.secondary)
                                            }
                                        )
                        }
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                }
            }
            .toolbar {
                Button("Trimite") {
                    viewModel.uploadPost(withTitle: titluPostare, withContent: descriere)
                    //viewModel.uploadProfileImage(selectedImage)
                }
            }
        }
        .onReceive(viewModel.$didUploadPost, perform: { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .padding()
        .navigationBarTitle("Postare Noua", displayMode: .inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

// MARK: - PREVIEW
struct CommunityAddMessage_Previews: PreviewProvider {
    static var previews: some View {
        CommunityAddPost()
            .environmentObject(AuthViewModel())
    }
}
