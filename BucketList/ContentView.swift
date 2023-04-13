//
//  ContentView.swift
//  BucketList
//
//  Created by Matheus Viana on 12/04/23.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
}


struct ContentView: View {
    let values = [1,5,3,6,2,9].sorted()
    
    var body: some View {
        List(values, id: \.self) {
            Text(String($0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
