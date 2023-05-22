//
//  ActivityLogEditView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 22.05.2023.
//

import SwiftUI

struct ActivityLogEditView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel

    @Environment(\.presentationMode) var presentationMode
    
    var activity: ActivityLog
    
    @State private var activityTime: String
    @State private var userWeight: String
    @State private var showDeleteConfirmation = false
    
    init(activity: ActivityLog, activityTime: Double, userWeight: Double) {
        self.activity = activity
        _activityTime = State(initialValue: String(activityTime))
        _userWeight = State(initialValue: String(userWeight))
    }
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(activity.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.horizontal, .top], 24)
                    
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
                    
                    VStack(alignment: .center) {
                        HStack {
                            HStack(alignment: .center) {
                                Image(systemName: "cylinder.split.1x2")
                                    .font(Font.largeTitle.weight(.regular))
                                    .imageScale(.large)
                                    .foregroundColor(Color.accent)
                                
                                VStack(alignment: .leading) {
                                    Text("Valoare MET:")
                                        .font(.headline)
                                    Text("\(activity.met, specifier: "%.1f")")
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
                                    Text("\(activity.met * (Double(activityTime) ?? 1), specifier: "%.1f")")
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
                                    Text("\(calculateMet(met: activity.met, userWeight: Double(userWeight) ?? 0, activityTime: Double(activityTime) ?? 0), specifier: "%.1f") kCal")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .card()
                        
                        Button {
                            logViewModel.editActivity(id: activity.id, title: activity.title, calories: calculateMet(met: activity.met, userWeight: Double(userWeight) ?? 0, activityTime: Double(activityTime) ?? 0), duration: Double(activityTime) ?? 0, met: activity.met, weight: Double(userWeight) ?? 0) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            RectangleButton(text: "Adaugă la jurnal", isDisabled: activityTime.isEmpty || userWeight.isEmpty ? true : false)
                        }
                        .disabled(activityTime.isEmpty || userWeight.isEmpty)
                    }
                }
                .navigationBarItems(trailing:
                        Button {
                             showDeleteConfirmation.toggle()
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(Color.red)
                        }
                        .alert(isPresented:$showDeleteConfirmation) {
                            Alert(
                                title: Text("Ești sigur că vrei să ștergi această mâncare?"),
                                message: Text("Această acțiune este permanentă"),
                                primaryButton: .destructive(Text("Șterge")) {
                                    logViewModel.deleteActivity(id: activity.id) {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                },
                                secondaryButton: .cancel(Text("Renunță"))
                            )
                        }
                )
                .navigationBarTitle("Editare activitate", displayMode: .inline)
            }
        }
    }
    
    // MARK: - FUNCTIONS
    func calculateMet(met: Double, userWeight: Double, activityTime: Double) -> Double {
        var result = (met * 3.5 * userWeight) / 200
        
        result = result * activityTime
        
        return result.rounded(toPlaces: 1)
    }
}

// MARK: - PREVIEWS
struct ActivityLogEditView_Previews: PreviewProvider {
    static var previews: some View {
        let logViewModel = LogViewModel()
        logViewModel.logs = logPreviewData
        return Group {
            NavigationView {
                ActivityLogEditView(activity: logPreviewData[0].activities[0],
                                    activityTime: logPreviewData[0].activities[0].duration,
                                    userWeight: logPreviewData[0].activities[0].weight)
            }
            NavigationView {
                ActivityLogEditView(activity: logPreviewData[0].activities[0],
                                    activityTime: logPreviewData[0].activities[0].duration,
                                    userWeight: logPreviewData[0].activities[0].weight)
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(logViewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
