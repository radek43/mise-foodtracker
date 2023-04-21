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
    
    @Environment(\.presentationMode) var presentationMode
    
    init(user: User) {
        _calorieGoal = State(initialValue: user.calorie_goal)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
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
                
                    Text("Recomandări")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding([.top, .leading, .trailing])
                        .padding(.horizontal)
                    
                    
                    Button {
                        calorieGoal = "2311"
                    } label: {
                        HStack(spacing: 20.0) {
                            Image("weightScale")
                                .resizable()
                                .foregroundColor(Color.success)
                                .frame(width: 35, height: 35)
                                .padding(.leading, 10)
                            VStack(alignment: .leading) {
                                Text("Pierdere în greutate")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.success)
                                Text("Raport caloric necesar:")
                                    .font(.subheadline)
                                Text("2311kCal")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .card()
                    }
                    .buttonStyle(.plain)

                    Button {
                        calorieGoal = "2642"
                    } label: {
                        HStack(spacing: 20.0) {
                            Image(systemName: "hand.thumbsup.fill")
                                .resizable()
                                .foregroundColor(Color.information)
                                .frame(width: 35, height: 35)
                                .padding(.leading, 10)
                            VStack(alignment: .leading) {
                                Text("Menținere")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.information)
                                Text("Raport caloric necesar:")
                                    .font(.subheadline)
                                Text("2642kCal")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .card()
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        calorieGoal = "2951"
                    } label: {
                        HStack(spacing: 20.0) {
                            Image("dumbbell.fill")
                                .resizable()
                                .foregroundColor(Color.alert)
                                .frame(width: 35, height: 20)
                                .padding(.leading, 10)
                            VStack(alignment: .leading) {
                                Text("Creștere în greutate")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.alert)
                                Text("Raport caloric necesar:")
                                    .font(.subheadline)
                                Text("2951kCal")
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
