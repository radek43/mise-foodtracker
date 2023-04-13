//
//  LoginView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 8/9/22.
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
                    //  HEADER
                    AuthenticationHeaderView(title1: "Bine ai venit!", title2: "")
                    
                    VStack(spacing: 40) {
                        CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                        CustomInputFields(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 44)
                    //  RESET PASSWORD
                    HStack {
                        Spacer()
                        NavigationLink {
                            Text("Reset password view..")
                        } label: {
                            Text("Ai uitat parola?")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.top)
                                .padding(.trailing, 24)
                        }
                    }
                    //  AUTHENTICATION
                    Button {
                        Task {
                            try await authViewModel.signIn(email: email, password: password)
                        }
                    } label: {
                        Text("Autentifica-te")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.accent)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .shadow(color: Color.black.opacity(0.1), radius: 12)
                    
                    Spacer()
                    //  REGISTER
                    NavigationLink {
                        RegistrationView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Nu ai cont?")
                                .font(.footnote)
                            Text("Inregistreaza-te")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.bottom, 32)
                }
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            }  //:  END ZSTACK
        }  //:  END NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())
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

