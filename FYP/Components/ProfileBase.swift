//
//  ProfileBase.swift
//  FYP
//
//  Created by Jack O'Meara on 23/10/2023.
//

import SwiftUI

struct ProfileBase: View {
    var user: User
    var stat1: String
    var value1: Int
    var stat2: String
    var value2: Int
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .foregroundColor(.green)
            .frame(width:140, height:140)
            .padding(.top, 60)
            .padding(.bottom, 20)
        
        
        Text(user.name)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        Text(user.email)
            .font(.headline)
            .foregroundStyle(.gray)
        
        HStack{
            VStack {
                Text(stat1)
                    .font(.headline)
                Text(String(value1))
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.padding(.trailing, 10)
            VStack {
                Text(stat2)
                    .font(.headline)
                Text(String(value2))
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.padding(.leading, 10)
        }
        .padding(.top, 20)
    }
}

#Preview {
    ProfileBase(user: User(id: UUID(), name: "Jack O'Meara", email: "jedomeara@gmail.com", profilePhoto: "none"), stat1:"Attempts", value1: 26, stat2: "Exercises", value2: 4)
}
