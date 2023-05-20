//
//  AddWaterView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 17.05.2023.
//

import SwiftUI

struct AddWaterView: View {
    
    @EnvironmentObject var logViewModel: LogViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var percent: Double
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    
    var date: Date
    
    init(percent: Double, date: Date) {
        _percent = State(initialValue: percent)
        self.date = date
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            VStack {
                Text("Apă consumată: \(percent, specifier: "%.0f")ml")
                ZStack(alignment: .center) {
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 300, height: 320)
                    
                    Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/2000)
                        .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                        .frame(width: 300, height: 320)
                        
                    Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/2000)
                        .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                        .opacity(0.5)
                        .frame(width: 300, height: 320)
                }
                .mask(
                    Image("glass")
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                )
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ value in
                    if value.translation.height < 0 {
                        percent += 250
                    }
                    
                    if value.translation.height > 0 {
                        percent -= 250
                    }
                }))
                
                Text("Adaugă apă glisând în sus paharul")
                    .foregroundColor(Color.secondary)
            }
            .navigationTitle("Adaugă apă")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Adaugă") {
                    logViewModel.addWaterToLog(date: date, water: percent) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
                    self.waveOffset2 = Angle(degrees: -180)
                }
        }
        }
    }
}

struct AddWaterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddWaterView(percent: 250, date: Date().stripTime())
            AddWaterView(percent: 250, date: Date().stripTime())
                .preferredColorScheme(.dark)
        }
        
        
    }
}
