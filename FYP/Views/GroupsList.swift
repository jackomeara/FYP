//
//  GroupsList.swift
//  FYP
//
//  Created by Jack O'Meara on 31/10/2023.
//

import SwiftUI

struct GroupsList: View {
    @ObservedObject var groupModel = GroupViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupModel.groups) {group in
                    NavigationLink(destination: GroupView(group: group)) {
                        HStack {
                            Text(group.name)
                                .font(.title3)
                            Spacer()
                            Image(systemName: "person.fill")
                            Text(String(group.players.count))
                        }
                        
                    }
                }
            }
            .navigationTitle("Groups")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    GroupsList()
}
