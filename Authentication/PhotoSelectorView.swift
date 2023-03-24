//
//  PhotoSelectorView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/28/22.
//

import SwiftUI

struct PhotoSelectorView: View {
    // MARK: - PROPERTIES
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?             // var pt afisarea imaginii selectate in view
//    @EnvironmentObject var viewModel: AuthViewModel

    // MARK: - BODY
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Incarca", title2: "o poza de profil")
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    if let profileImage = profileImage {    // daca s-a ales o imagine din galeria telefonului creaza constanta si executa ..
                        profileImage
                            .resizable()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 180, height: 180)
                    }
                }
                .padding(.top, 44)
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                Text("Adauga o imagine")
                    .foregroundColor(Color.secondary)
            }
            
            if let selectedImage = selectedImage {
                Button {
//                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Contiuna")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.accent)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: Color.black.opacity(0.1), radius: 12)
            }
                    
            Spacer()
            
        }
        .ignoresSafeArea()
        .background(Color.background.edgesIgnoringSafeArea(.all))
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

// MARK: - PREVIEW
struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoSelectorView()
            PhotoSelectorView()
                .preferredColorScheme(.dark)
        }
        
    }
}
