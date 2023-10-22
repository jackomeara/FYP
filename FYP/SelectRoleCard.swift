//
//  SelectRoleCard.swift
//  FYP
//
//  Created by Jack O'Meara on 17/10/2023.
//

import SwiftUI

struct SelectRoleCard: View {
    var image: Image
    var title: String
    
    var body: some View {
        VStack{
            Button {
            } label: {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(.blue, lineWidth: 4))
                    .frame(width: 140, height: 140)
            }
            Text(title)
                .font(.title2)
        }
    }
}

#Preview {
    SelectRoleCard(image: Image("coach"), title: "Coach")
}
