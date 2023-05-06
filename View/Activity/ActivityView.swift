//
//  ActivityView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 07.05.2022.
//

import SwiftUI

struct ActivityView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var activityViewModel = ActivityViewModel()
    
    @State private var showEditView = false
    @State private var showActivityConfirmSheet = false
    @State private var showInfoSheet = false
    
    // MARK: - BODY
    var body: some View {
        if let user = authViewModel.currentUser {
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        // Refresh list
                        RefreshControl(coordinateSpace: .named("RefreshControl")) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                activityViewModel.loadActivities()
                            }
                        }
                        VStack {
                            // Search bar
                            SearchBar(placeholderText: "Caută o activitate",text: .constant(""))
                                .padding([.top, .horizontal])
                                .padding(.bottom, 5.0)
                            
                            // Activity list
                            VStack(alignment: .leading) {
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
                                    NavigationLink {
                                        ActivityConfrimView(activityConfirmViewModel: ActivityConfirmViewModel(withActivityId: activity.id))
                                    } label: {
                                        HStack {
                                            Text(activity.title)
                                                .foregroundColor(Color(UIColor.label))
                                                .fixedSize(horizontal: false, vertical: true)
                                            Spacer()
                                            Text(activity.met)
                                                .foregroundColor(Color(UIColor.label))
                                        }
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
                        }
                    }
                    .background(Color.background.edgesIgnoringSafeArea(.all))
                    .coordinateSpace(name: "RefreshControl")
                    .navigationBarItems(
                        leading: user.is_staff == true ?
                            NavigationLink {
                                AddActivityView()
                            } label: {
                                Image(systemName: "square.and.pencil")
                            } : nil,
                        trailing:
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
            ActivityView(activityViewModel: activityViewModel)
            ActivityView(activityViewModel: activityViewModel)
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
