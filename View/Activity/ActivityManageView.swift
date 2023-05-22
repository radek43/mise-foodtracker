//
//  ActivityManageView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 22.05.2023.
//

import SwiftUI

struct ActivityManageView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var logViewModel: LogViewModel
    
    let date: Date
    
    var filteredLogs: [Log] {
        logViewModel.logs.filter {
            Calendar.current.compare($0.dateTime, to: date, toGranularity: .day) == .orderedSame
        }
    }
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            ZStack {
                Color.background.ignoresSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 60.0) {
                        // Recent logs
                        if !filteredLogs.isEmpty {
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Nume activitate")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("Calorii arse")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                                    Divider()
                                    ForEach(filteredLogs[0].activities) { activity in
                                        NavigationLink {
                                            ActivityLogEditView(activity: activity, activityTime: activity.duration, userWeight: activity.weight)
                                        } label: {
                                            HStack {
                                                Text(activity.title)
                                                    .foregroundColor(Color(UIColor.label))
                                                    .fixedSize(horizontal: false, vertical: true)
                                                Spacer()
                                                Text("\(activity.calories, specifier: "%.f")")
                                                    .foregroundColor(Color(UIColor.label))
                                                Image(systemName: "chevron.right")
                                            }
                                        }
                                        if activity.id != filteredLogs[0].activities.last?.id {
                                            Divider()
                                        }
                                    }
                                }
                                .card()
                            }
                            .padding(.top)
                        }
                    }
                    .navigationTitle("Istoric activități")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .background(Color.background.edgesIgnoringSafeArea(.all))
                .coordinateSpace(name: "RefreshControl")
            }
        }
    }
}

// MARK: - PREVIEWS
struct ActivityManageView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        let logViewModel = LogViewModel()
        logViewModel.logs = logPreviewData
        return Group {
            NavigationView {
                ActivityManageView(date: Date().stripTime())
            }
            NavigationView {
                ActivityManageView(date: Date().stripTime())
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(viewModel)
        .environmentObject(logViewModel)
    }
}
