//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dola Fakeye on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: imageString)
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.ultraLight) //changed the boldness
                .foregroundStyle(.black) //changed the color
            
            Spacer()
            
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "hand.thumbsup"
                let imageString2 = "sun.max.fill"
                
                message = (message == message1 ? message2 :  message1)
                imageString = (imageString == imageString1 ? imageString2 : imageString1)
                
                
//                if message == message1 {
//                    message = message2
//                    imageString = imageString1
//                } else {
//                    message = message1
//                    imageString = imageString2
//                }
                
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
