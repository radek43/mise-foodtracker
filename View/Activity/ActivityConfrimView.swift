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
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activityConfirmViewModel: ActivityConfirmViewModel
    
    @State private var activityTime = ""
    @State private var userWeight = ""
    @State private var showDeleteConfirmation = false
    
    // MARK: - BODY
    var body: some View {
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
                        
                        HStack {
                            Text("Timp efectuat:")
                                .foregroundColor(Color.formText)
                            TextField("", text: $activityTime)
                            Text("minute")
                                .foregroundColor(Color.formText)
                        }
                        .card()
                        HStack {
                            Text("Greutate:")
                                .foregroundColor(Color.formText)
                            TextField("", text: $userWeight)
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
                                    Text("\(activityData.met, specifier: "%.1f")")
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
                                    Text("246 kCal")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .card()
                        
                        Button {
                            // addToJournal()
                        } label: {
                            RectangleButton(text: "Adaugă la jurnal")
                        }
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

struct ActivityConfrimView_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        let viewModel = ActivityConfirmViewModel(withActivityId: 1)
        viewModel.activity = activityPreviewData[0]
        return Group {
            NavigationView {
                ActivityConfrimView(activityConfirmViewModel: viewModel)
            }
            NavigationView {
                ActivityConfrimView(activityConfirmViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
    }
}
