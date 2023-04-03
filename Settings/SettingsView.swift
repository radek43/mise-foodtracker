//
//  SettingsView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 08.03.2023.
//

import Foundation
import SwiftUI
import Kingfisher


struct SettingsView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        if let user = viewModel.currentUser {
            SettingsScreen(name: user.fullname, is_staff: user.is_staff, logoutAction: viewModel.signOut)
        }
    }
}
