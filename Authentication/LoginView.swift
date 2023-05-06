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
    @EnvironmentObject var authViewModel: AuthViewModel
    
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
                        CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                        CustomInputFields(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
                    }
                    .padding(.top, 30)
                    // Password reset
                    HStack {
                        Spacer()
                        NavigationLink {
                            Text("Reset password view..")
                        } label: {
                            Text("Am uitat parola")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.top)
                                .padding(.trailing, 24)
                        }
                    }
                    // Sign in
                    Button {
                        Task {
                            try await authViewModel.signIn(email: email, password: password)
                        }
                    } label: {
                        RectangleButton(text: "Autentifică-te")
                    }
                    
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
                }
                .edgesIgnoringSafeArea(.top)
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}


// MARK: - PREVIEWS
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
    }
}

