//
//  ActivityDetailConfrim.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.04.2023.
//

import SwiftUI

struct ActivityDetailConfrim: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var activityDetailViewModel: ActivityDetailViewModel
    
    @State private var activityTime = ""
    @State private var userWeight = ""
    @State private var showDeleteConfirmation = false
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        if authViewModel.currentUser != nil {
            ZStack(alignment: .top) {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                if let activityData = activityDetailViewModel.activity {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 12) {
                            // HEADER
                            Text(activityData.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.horizontal, .top], 24)
                            
                            // FOOD META
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
                                        Text("Valoare MET")
                                            .font(.headline)
                                        Text(activityData.met)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }
                                    Spacer()
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
                                        Text("Timp MET")
                                            .font(.headline)
                                        Text(activityData.met)
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
                            // FOOD CHART
                            
                            
                            // ADD TO JOURNAL
                            Button {
                                // viewModel.login(withEmail: email, password: password)
                            } label: {
                                Text("Adaugă la jurnal")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 50)
                                    .frame(maxWidth: 580)
                                    .background(Color.accent)
                                    .clipShape(Capsule())
                                    .padding()
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 12)
                            
                            Spacer()
                        } //: END MAIN VSTACK
                        .frame(maxWidth: 580)
                        .navigationBarItems(trailing: authViewModel.currentUser?.is_staff == true ?
                            HStack(spacing: 15) {
                                NavigationLink {
                                    EditActivityView(activity: activityData)
                                } label: {
                                    HStack {
                                        Text("Editează")
                                        Image(systemName: "square.and.pencil")
                                    }
                                }
                                Button {
                                     showDeleteConfirmation.toggle()
                                } label: {
                                    HStack {
                                        Text("Șterge")
                                        Image(systemName: "trash")
                                    }
                                }
                                .alert(isPresented:$showDeleteConfirmation) {
                                    Alert(
                                        title: Text("Ești sigur că vrei să ștergi această activitate?"),
                                        message: Text("Această acțiune este permanentă"),
                                        primaryButton: .destructive(Text("Șterge")) {
                                            Task {
                                                try await activityDetailViewModel.deleteActivity()
                                            }
                                            self.presentationMode.wrappedValue.dismiss()
                                        },
                                        secondaryButton: .cancel(Text("Renunță"))
                                    )
                                }
                            }
                            : nil
                        )
                        .navigationBarTitle("", displayMode: .inline)
                    }
                }
            }
            .onAppear {
                Task(priority: .medium) {
                    try await self.activityDetailViewModel.fetchActivity()
                }
            }
        } //: END ZSTACK
    }
}

struct ActivityDetailConfrim_Previews: PreviewProvider {
    static var previews: some View {
        let authViewModel = AuthViewModel()
        authViewModel.currentUser = userPreviewData
        let viewModel = ActivityDetailViewModel(withActivityId: 1)
        viewModel.activity = previewActivityData[0]
        return Group {
            NavigationView {
                ActivityDetailConfrim(activityDetailViewModel: viewModel)
            }
            NavigationView {
                ActivityDetailConfrim(activityDetailViewModel: viewModel)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(authViewModel)
    }
}
