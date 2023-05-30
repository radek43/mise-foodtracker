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
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var isDisabled: Bool {
        if email.isEmpty || username.isEmpty || fullname.isEmpty || password.isEmpty || !password.isValid(regexPattern: Regex.password.rawValue) || !email.isValid(regexPattern: Regex.email.rawValue) || !username.isValid(regexPattern: Regex.username.rawValue){
            return true
        } else {
            return false
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView(title1: "", title2: "Crează un cont nou")
            
            // Registration data
            VStack(spacing: 18.0) {
                InputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    .keyboardType(.emailAddress)
                VStack(alignment: .leading, spacing: 3) {
                    InputField(imageName: "person", placeholderText: "Nume Utilizator", text: $username)
                    Text("• poate conține doar litere, cifre, puncte și underscore")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.footnote)
                        .foregroundColor(Color.formText)
                        .padding(.horizontal, 32)
                }
                InputField(imageName: "person", placeholderText: "Nume Complet", text: $fullname)
                VStack(alignment: .leading, spacing: 3) {
                    InputField(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
                    Text("• minim 8 caractere, cu cel puțin o cifră și o literă mare")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.footnote)
                        .foregroundColor(Color.formText)
                        .padding(.horizontal, 32)
                }
            }
            .frame(maxWidth: 580)
            .padding(.top, 30)
            
            Button {
                Task {
                    try await authViewModel.signUp(email: email, username: username, fullname: fullname, password: password)
                }
            } label: {
                RectangleButton(text: "Continuă", isDisabled: isDisabled)
            }
            .disabled(isDisabled)
            .onReceive(authViewModel.$registrationError, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Eroare"), message: Text(authViewModel.registrationError?.localizedDescription ?? ""))
            })
            
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
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            RegistrationView()
            RegistrationView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
