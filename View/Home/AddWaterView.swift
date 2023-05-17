//
//  AddWaterView.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 17.05.2023.
//

import SwiftUI

struct AddWaterView: View {
    @State private var percent = 0.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    
    var body: some View {
        VStack {
            Text("Apă consumată: 250ml")
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(Color.secondary)
                    .frame(width: 300, height: 320)
                
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                    .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                    .frame(width: 300, height: 320)
                    
                Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(percent)/100)
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
                    percent += 12.5
                }
                
                if value.translation.height > 0 {
                    percent -= 12.5
                }
            }))
            
            Text("Adaugă apă glisând în sus paharul")
                .foregroundColor(Color.secondary)
        }
        .navigationTitle("Adaugă apă")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Adaugă") {
                // add water to log
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

struct AddWaterView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            AddWaterView()
                .preferredColorScheme(.dark)
        }
        
    }
}
