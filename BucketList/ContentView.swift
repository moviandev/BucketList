//
//  ContentView.swift
//  BucketList
//
//  Created by Matheus Viana on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onTapGesture {
                    let str = "Text manager"
                    let url = getDocumentsDirectory().appendingPathComponent("message.text")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .padding()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
