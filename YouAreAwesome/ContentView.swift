//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dola Fakeye on 8/25/25.
// Week 1 work

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    var body: some View {
        
        VStack {
            Spacer()
            Image(imageName)
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .frame(width: 400, height: 400) //added this to normalize picture within screen
                
            
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.heavy) //changed the boldness
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Show Message") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                
                message = (message == message1 ? message2 :  message1)

                //TODO: - Update the imageName variable -
                imageName = "image\(imageNumber)"
                  
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
            }
            .buttonStyle(.borderedProminent) //can place modifiers outside container if they do the same
            //thing for multiple buttons. Makes it more efficient to edit
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
