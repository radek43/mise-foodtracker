//
//  ActivityListView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 07.05.2022.
//

import SwiftUI

struct ActivityListView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject var activityListViewModel = ActivityListViewModel()
    
    @State private var showEditView = false
    @State private var showActivityConfirmSheet = false
    @State private var showInfoSheet = false
    @State private var isHitTestEnabled = false
    
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
                                activityListViewModel.loadActivities()
                            }
                        }
                        VStack {
                            // Search bar
                            SearchBar(placeholderText: "Caută o activitate",text: .constant(""))
                                .frame(maxWidth: 580)
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
                                ForEach(activityListViewModel.activities) { activity in
                                    NavigationLink {
                                        ActivityConfrimView(activityConfirmViewModel: ActivityConfirmViewModel(withActivityId: activity.id), userWeight: user.weight)
                                    } label: {
                                        HStack {
                                            Text(activity.title)
                                                .foregroundColor(Color(UIColor.label))
                                                .fixedSize(horizontal: false, vertical: true)
                                            Spacer()
                                            Text("\(activity.met, specifier: "%.1f")")
                                                .foregroundColor(Color(UIColor.label))
                                        }
                                    }
                                    if activity.id != activityListViewModel.activities.last?.id {
                                        Divider()
                                    }
                                }
                                .allowsHitTesting(isHitTestEnabled)
                            }
                            .card()
                            .padding(.bottom)
                            .onAppear {
                                activityListViewModel.loadActivities()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    isHitTestEnabled = true
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
                                AddActivityListView()
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
struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        viewModel.currentUser = userPreviewData
        let activityListViewModel = ActivityListViewModel()
        activityListViewModel.activities = activityPreviewData
        return Group {
            ActivityListView(activityListViewModel: activityListViewModel)
            ActivityListView(activityListViewModel: activityListViewModel)
                .preferredColorScheme(.dark)
        }
        .environmentObject(viewModel)
    }
}
