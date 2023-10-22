//
//  SplashHeader.swift
//  FYP
//
//  Created by Jack O'Meara on 20/10/2023.
//

import SwiftUI

struct SplashHeader: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Ellipse()
                    .fill(.green)
                    .frame(width: geometry.size.width * 1.6, height: geometry.size.height * 0.5)
                    .position(x: geometry.size.width / 2.9, y: geometry.size.height * 0.16)
                    .shadow(radius: 10)
                    .edgesIgnoringSafeArea(.all)
                
                HStack{
                    Image(systemName: "figure.mixed.cardio")
                        .resizable()
                        .frame(width: 70, height: 90)
                        .padding()
                    Image(systemName: "figure.cross.training")
                        .resizable()
                        .frame(width: 70, height: 90)
                        .padding()
                }
                .padding(.top, 40)
                .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SplashHeader()
}
