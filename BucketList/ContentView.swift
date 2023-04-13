//
//  ContentView.swift
//  BucketList
//
//  Created by Matheus Viana on 12/04/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
    var id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}


struct ContentView: View {
    let users = [
        User(firstName: "Maria", lastName: "ZAparecida"),
        User(firstName: "Jose", lastName: "Oliveira"),
        User(firstName: "Solange", lastName: "Slange")
    ].sorted()
    
    var body: some View {
        List(users) {
            Text("\($0.firstName) \($0.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
