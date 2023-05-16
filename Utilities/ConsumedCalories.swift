//
//  ConsumedCalories.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 14.05.2023.
//

import SwiftUI

struct ConsumedCalories: View {
    let totalCalories: Double
    let totalActivityCalories: Double
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        HStack {
            if horizontalSizeClass == .regular {
                HStack {
                    Text("\(totalCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Consumat")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                HStack {
                    Text("\(totalActivityCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Ars")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                HStack {
                    Text("\(totalCalories - totalActivityCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Net")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
            } else {
                VStack {
                    Text("\(totalCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Consumat")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                VStack {
                    Text("\(totalActivityCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Ars")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                VStack {
                    Text("\(totalCalories - totalActivityCalories, specifier: "%.f")")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Net")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ConsumedCalories_Previews: PreviewProvider {
    static var previews: some View {
        ConsumedCalories(totalCalories: 0, totalActivityCalories: 0)
    }
}
