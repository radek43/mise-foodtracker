//
//  LoginView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 09.08.2022.
//

import SwiftUI


struct LoginView: View {
    // MARK: - PROPERTIES
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var isDisabled: Bool {
        if email.isEmpty || password.isEmpty || !email.isValid(regexPattern: Regex.email.rawValue) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    // Header card
                    HeaderView(title1: "", title2: "Bine ai venit!")
                    
                    VStack(spacing: 18.0) {
                        InputField(imageName: "envelope", placeholderText: "Email", text: $email)
                        InputField(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
                    }
                    .padding(.top, 45)

                    // Sign in
                    Button {
                        Task {
                            try await authViewModel.signIn(email: email, password: password)
                        }
                    } label: {
                        RectangleButton(text: "Autentifică-te", isDisabled: isDisabled)
                    }
                    .padding(.top, 20)
                    .disabled(isDisabled)
                    .onReceive(authViewModel.$error, perform: { error in
                        if error != nil {
                            showAlert.toggle()
                        }
                    })
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Eroare"), message: Text(authViewModel.error?.localizedDescription ?? ""))
                    })
                    
                    Spacer()
                    // Register
                    NavigationLink {
                        RegistrationView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Nu ai cont?")
                                .font(.footnote)
                            Text("Înregistrează-te")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.bottom, 32)
                }
                .edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: - PREVIEWS
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        return Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}

