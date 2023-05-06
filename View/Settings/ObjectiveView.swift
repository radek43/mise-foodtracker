//
//  ObjectiveView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 19.04.2023.
//

import SwiftUI
import KeyboardToolbars

struct ObjectiveView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var settingsViewModel = SettingsViewModel()
    
    @State private var calorieGoal: String
    @State private var recommendationsDetail = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init(user: User) {
        _calorieGoal = State(initialValue: user.calorie_goal)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            if let user = authViewModel.currentUser {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Obiectiv caloric:")
                                .foregroundColor(Color.formText)
                            TextField("", text: $calorieGoal)
                                .numbersOnly($calorieGoal, includeDecimal: true, decimalPlaces: 1)
                            Text("kCal")
                                .foregroundColor(Color.formText)
                        }
                        .card()
                        .padding(.top)
                        
                        HStack {
                            Text("Recomandări")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Spacer()
                            Button {
                                recommendationsDetail.toggle()
                            } label: {
                                Image(systemName: "questionmark.circle")
                            }
                            .sheet(isPresented: $recommendationsDetail) {
                                ZStack {
                                    Color.background
                                        .edgesIgnoringSafeArea(.all)
                                    VStack(alignment: .center) {
                                        HStack {
                                            Text("Cum sunt calculate recomandările?")
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Spacer()
                                            Button {
                                                recommendationsDetail.toggle()
                                            } label: {
                                                Image(systemName: "xmark.circle")
                                            }
                                        }
                                        .padding(.horizontal, 24)
                                        .padding(.top, 40)
                                        VStack {
                                            Text("Recomandările sunt generate în funcție de rata metabolică bazală (BMR) obținută folosind ecuația Harris-Benedict, care calculează cantitatea de energie necesară corpului în repaus pentru a menține funcțiile normale ale corpului, cum ar fi respirația, circulația și creșterea celulelor și reparație.")
                                                .card()
                                            
                                            Text("La aceasta se adaugă nivelul de activitate (introdus în setările profilului) pentru a se obține raportul caloric necesar în funcție de obiectivul pe care dvs. îl alegeți.")
                                                .card()
                                            Spacer()
                                        }
                                        
                                    }
                                }
                            }
                        }
                        .padding([.top, .leading, .trailing])
                        .padding(.horizontal)
                        
                        Button {
                            calorieGoal = "\(Float(user.tdee - user.tdee * 0.15).roundTo(places: 1))"
                            
                        } label: {
                            HStack(spacing: 20.0) {
                                Image("weightScale")
                                    .resizable()
                                    .foregroundColor(Color.green)
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 10)
                                VStack(alignment: .leading) {
                                    Text("Pierdere în greutate")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.green)
                                    Text("Raport caloric necesar:")
                                        .font(.subheadline)
                                    Text("\(Float(user.tdee - user.tdee * 0.15).roundTo(places: 1), specifier: "%.1f")kCal")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                Spacer()
                            }
                            .card()
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            calorieGoal = "\(Float(user.tdee).roundTo(places: 1))"
                        } label: {
                            HStack(spacing: 20.0) {
                                Image(systemName: "hand.thumbsup.fill")
                                    .resizable()
                                    .foregroundColor(Color.blue)
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 10)
                                VStack(alignment: .leading) {
                                    Text("Menținere")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.blue)
                                    Text("Raport caloric necesar:")
                                        .font(.subheadline)
                                    Text("\(Float(user.tdee).roundTo(places: 1), specifier: "%.1f")kCal")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                Spacer()
                            }
                            .card()
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            calorieGoal = "\(Float(user.tdee * 0.15 + user.tdee).roundTo(places: 1))"
                            
                        } label: {
                            HStack(spacing: 20.0) {
                                Image("dumbbell.fill")
                                    .resizable()
                                    .foregroundColor(Color.red)
                                    .frame(width: 35, height: 20)
                                    .padding(.leading, 10)
                                VStack(alignment: .leading) {
                                    Text("Creștere în greutate")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.red)
                                    Text("Raport caloric necesar:")
                                        .font(.subheadline)
                                    Text("\(Float(user.tdee * 0.15 + user.tdee).roundTo(places: 1), specifier: "%.1f")kCal")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                Spacer()
                            }
                            .card()
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(maxWidth: 580)
                    .navigationTitle("Obiectiv")
                    .navigationBarTitleDisplayMode(.inline)
                    .addHideKeyboardButton()
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                    .toolbar {
                        Button("Modifică") {
                            Task(priority: .medium) {
                                try await self.settingsViewModel.updateObjective(calorieGoal: calorieGoal)
                            }
                        }
                    }
                    .onReceive(settingsViewModel.$didUpdateObjective, perform: { success in
                        if success {
                            Task {
                                try await self.authViewModel.getUser()
                            }
                            presentationMode.wrappedValue.dismiss()
                        }
                    })
                }
            }
        }
    }
}

// MARK: - PREVIEWS
struct ObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        return Group {
            NavigationView {
                ObjectiveView(user: userPreviewData)
            }
            NavigationView {
                ObjectiveView(user: userPreviewData)
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(authViewModel)
    }
}
