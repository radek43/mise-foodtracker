//
//  LoginView.swift
//  maiIncercSiEu
//
//  Created by Radu Bila on 8/9/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            // parent container
            VStack {
                
                // header view
                AuthenticationHeaderView(title1: "", title2: "Bine ai venit!")
                
                VStack(spacing: 40) {
                    CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputFields(imageName: "lock", placeholderText: "Parola", isSecureField: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                
                HStack {
                    Spacer()
                    NavigationLink {
                        Text("Reset password view..")
                        
                    } label: {
                        Text("Ai uitat parola?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.top)
                            .padding(.trailing, 24)
                    }
                }
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Autentifica-te")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
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
                .foregroundColor(Color(.systemBlue))

            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

