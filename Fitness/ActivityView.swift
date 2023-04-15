//
//  ActivityView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 5/7/22.
//

import SwiftUI

struct ActivityView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var activityViewModel = ActivityViewModel()
    
    @State private var showActivityConfirmSheet = false
    @State private var showInfoSheet = false
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Color.background.ignoresSafeArea(.all)
                        VStack {
                            HStack {
                                Text("Nume activitate")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("MET")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            
                            Divider()
                            
                            ForEach(activityViewModel.activities) { activity in
                                Button {
                                    self.showActivityConfirmSheet.toggle()
                                } label: {
                                    HStack {
                                        Text(activity.title)
                                            .foregroundColor(Color(UIColor.label))
                                        Spacer()
                                        Text(activity.met)
                                            .foregroundColor(Color(UIColor.label))
                                    }
                                }
                                .sheet(isPresented: $showActivityConfirmSheet) {
                                    ActivityDetailConfrim()
                                }
                                if activity.id != activityViewModel.activities.last?.id {
                                    Divider()
                                }
                            }
                        }
                        .card()
                        .padding(.bottom)
                        .onAppear {
                            Task {
                                try await self.activityViewModel.fetchActivities()
                            }
                        }
                        
                        .navigationTitle("Activitate")
                        .navigationBarTitleDisplayMode(.automatic)
                        
                    }
                }
                .background(Color.background.edgesIgnoringSafeArea(.all))
                
                
                .navigationBarItems(
                    leading:
                        Button {
                            showInfoSheet.toggle()
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                        .sheet(isPresented: $showInfoSheet) {
                            ActivityInfoView()
                        }
                )
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}


// MARK: - PREVIEW
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        let activityViewModel = ActivityViewModel()
        activityViewModel.activities = activityPreviewData
        return Group {
            ActivityView()
            ActivityView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
