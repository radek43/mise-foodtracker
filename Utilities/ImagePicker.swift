//
//  ImagePicker.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 8/28/22.
//

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    // MARK: - PROPERTIES
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - FUNCTIONS
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

// MARK: - EXTENSIONS
extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
