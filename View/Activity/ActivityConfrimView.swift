//
//  ActivityConfrimView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.04.2023.
//

import SwiftUI


struct ActivityConfrimView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel

    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activityConfirmViewModel: ActivityConfirmViewModel
    
    @State private var data = Date().stripTime()
    @State private var activityTime = "45"
    @State private var userWeight: String
    @State private var showDeleteConfirmation = false
    
    init(activityConfirmViewModel: ActivityConfirmViewModel, userWeight: Double) {
        _userWeight = State(initialValue: String(userWeight))
        self.activityConfirmViewModel = activityConfirmViewModel
    }
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            ZStack(alignment: .top) {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                if let activityData = activityConfirmViewModel.activity {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(activityData.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding([.horizontal, .top], 24)
                            
                            VStack(alignment: .center) {
                                DatePicker(selection: $data, in: ...Date(), displayedComponents: .date) {
                                    Text("Data consumării:")
                                        .foregroundColor(Color.formText)
                                }
                                .onChange(of: data) { newDate in
                                    if let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: newDate) {
                                        data = midnight
                                        
                                    }
                                }
                                .accentColor(.primary)
                            }
                            .card()
                            
                            HStack {
                                Text("Timp efectuat:")
                                    .foregroundColor(Color.formText)
                                TextField("", text: $activityTime)
                                    .numbersOnly($activityTime, includeDecimal: true, decimalPlaces: 0, disableZero: true)
                                Text("minute")
                                    .foregroundColor(Color.formText)
                            }
                            .card()
                            HStack {
                                Text("Greutate:")
                                    .foregroundColor(Color.formText)
                                TextField("", text: $userWeight)
                                    .numbersOnly($userWeight, includeDecimal: true, decimalPlaces: 1, disableZero: true)
                                Text("kg")
                                    .foregroundColor(Color.formText)
                            }
                            .card()
                            
                            HStack(alignment: .center) {
                                HStack(alignment: .center) {
                                    Image(systemName: "cylinder.split.1x2")
                                        .font(Font.largeTitle.weight(.regular))
                                        .imageScale(.large)
                                        .foregroundColor(Color.accent)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Valoare MET:")
                                            .font(.headline)
                                        Text("\(activityData.met, specifier: "%.1f")")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .padding()
                                .background(Color.card)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .padding(.leading)
                                HStack(alignment: .center) {
                                    Image(systemName: "stopwatch")
                                        .font(Font.largeTitle.weight(.regular))
                                        .imageScale(.large)
                                        .foregroundColor(Color.accent)
                                    VStack(alignment: .leading) {
                                        Text("Timp MET:")
                                            .font(.headline)
                                        Text("\(activityData.met * (Double(activityTime) ?? 1), specifier: "%.1f")")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color.card)
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .padding(.trailing)
                            }
                            
                            HStack(alignment: .center) {
                                HStack {
                                    Image(systemName: "flame")
                                        .font(Font.largeTitle.weight(.regular))
                                        .imageScale(.large)
                                        .foregroundColor(Color.accent)
                                    VStack(alignment: .leading) {
                                        Text("Calorii arse")
                                            .font(.title2)
                                        Text("\(calculateMet(met: activityData.met, userWeight: Double(userWeight) ?? 0, activityTime: Double(activityTime) ?? 0), specifier: "%.1f") kCal")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .card()
                            
                            Button {
                                logViewModel.addActivityToLog(date: data, activity: ActivityLog(title: activityData.title, calories: calculateMet(met: activityData.met, userWeight: Double(userWeight) ?? 0, activityTime: Double(activityTime) ?? 0), duration: Double(activityTime) ?? 0))
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                RectangleButton(text: "Adaugă la jurnal", isDisabled: activityTime.isEmpty || userWeight.isEmpty ? true : false)
                            }
                            .disabled(activityTime.isEmpty || userWeight.isEmpty)
                        }
                        .frame(maxWidth: 580)
                        .navigationBarItems(
                            trailing: authViewModel.currentUser?.is_staff == true ?
                                HStack(spacing: 15) {
                                    NavigationLink {
                                        ActivityEditView(activity: activityData)
                                    } label: {
                                        HStack {
                                            Text("Editează")
                                            Image(systemName: "highlighter")
                                        }
                                    }
                                    Button {
                                        showDeleteConfirmation.toggle()
                                    } label: {
                                        HStack {
                                            Text("Șterge")
                                                .foregroundColor(Color.red)
                                            Image(systemName: "trash")
                                                .foregroundColor(Color.red)
                                        }
                                    }
                                    .alert(isPresented:$showDeleteConfirmation) {
                                        Alert(
                                            title: Text("Ești sigur că vrei să ștergi această activitate?"),
                                            message: Text("Această acțiune este permanentă"),
                                            primaryButton: .destructive(Text("Șterge")) {
                                                Task {
                                                    try await activityConfirmViewModel.deleteActivity()
                                                }
                                                self.presentationMode.wrappedValue.dismiss()
                                            },
                                            secondaryButton: .cancel(Text("Renunță"))
                                        )
                                    }
                                } : nil
                        )
                    }
                }
            }
            .onAppear {
                Task(priority: .medium) {
                    try await self.activityConfirmViewModel.fetchActivity()
                }
            }
            .navigationBarTitle("", displayMode: .inline)

        }
    }
    
    func calculateMet(met: Double, userWeight: Double, activityTime: Double) -> Double {
        var result = (met * 3.5 * userWeight) / 200
        
        result = result * activityTime
        
        return result.rounded(toPlaces: 1)
    }
    
}

struct ActivityConfrimView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        let viewModel = ActivityConfirmViewModel(withActivityId: 1)
        viewModel.activity = activityPreviewData[0]
        return Group {
            NavigationView {
                ActivityConfrimView(activityConfirmViewModel: viewModel, userWeight: 79)
            }
            NavigationView {
                ActivityConfrimView(activityConfirmViewModel: viewModel, userWeight: 79)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
    }
}
