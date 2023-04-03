//
//  RegistrationView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI


struct RegistrationView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            //  HEADER
            AuthenticationHeaderView(title1: "Creaza un cont nou", title2: "")
            
            // AUTH FORM
            VStack(spacing: 40) {
                CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                    .keyboardType(.emailAddress)
                CustomInputFields(imageName: "person", placeholderText: "Nume Utilizator", text: $username)
                CustomInputFields(imageName: "person", placeholderText: "Nume Complet", text: $fullname)
                CustomInputFields(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
            }
            .padding(32)
            
            // REGISTRATION
            Button {
                viewModel.register(email: email, username: username, fullname: fullname, password: password)
            } label: {
                RegistrationButton(text: "Continua")
            }
            Spacer()
            
            // DISMISS
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Ai deja un cont existent?")
                        .font(.footnote)
                    Text("Autentifica-te")
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
