//
//  RegistrationView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
//

import SwiftUI


struct RegistrationView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView(title1: "", title2: "Crează un cont nou")
            
            // Registration data
            VStack(spacing: 18.0) {
                CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                    .keyboardType(.emailAddress)
                CustomInputFields(imageName: "person", placeholderText: "Nume Utilizator", text: $username)
                CustomInputFields(imageName: "person", placeholderText: "Nume Complet", text: $fullname)
                CustomInputFields(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
            }
            .padding(.top, 30)
            
            Button {
                Task {
                    try await authViewModel.signUp(email: email, username: username, fullname: fullname, password: password)
                }
            } label: {
                RectangleButton(text: "Continuă")
            }
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Ai deja un cont existent?")
                        .font(.footnote)
                    Text("Autentifică-te")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
        .background(Color.background.edgesIgnoringSafeArea(.all))
    }
}


// MARK: - PREVIEWS
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegistrationView()
            RegistrationView()
                .preferredColorScheme(.dark)
        }
    }
}
