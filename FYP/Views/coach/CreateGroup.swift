//
//  CreateGroup.swift
//  FYP
//
//  Created by Jack O'Meara on 07/11/2023.
//

import SwiftUI

struct CreateGroup: View {
    @State private var name: String = ""
    @ObservedObject private var groupModel = GroupViewModel()
//    @State private var group
    
    var body: some View {
        VStack {
            TextField(
                "Group Name",
                text: $name
            )            
            .padding(.horizontal, 30)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            
            Button("Create") {
//                groupModel.createNewGroup(group: group)
            }
        }
    }
}

#Preview {
    CreateGroup()
}
