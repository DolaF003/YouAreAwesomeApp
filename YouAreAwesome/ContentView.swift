//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dola Fakeye on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.heavy) //changed the boldness
                .foregroundStyle(.red) //changed the color
            Button("Click Me!") {
                message = "Awesome!"
            }
                
        }
        
        .padding()
        
    }
}

#Preview {
    ContentView()
}
