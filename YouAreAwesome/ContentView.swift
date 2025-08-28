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
            Spacer()
            Image(systemName: "swift")
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200) //added an invisble frame, made it smaller 
            
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.ultraLight) //changed the boldness
                .foregroundStyle(.black) //changed the color
            
            Spacer()
            
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                }
                
                
                Button("Great!") {
                    message = "Great!"
                }
                
                
                
            }
            .buttonStyle(.borderedProminent) //can place modifiers outside container if they do the same
            //thing for multiple buttons. Makes it more efficient to edit
            .font(.title2)
            .tint(.orange)
            
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
