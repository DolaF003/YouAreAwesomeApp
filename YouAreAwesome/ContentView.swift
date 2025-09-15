//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dola Fakeye on 8/25/25.
// week 1 work (some week 2 added due to Git issues)

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1 //lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    let numberofImages = 10
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.heavy) //changed the boldness
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .frame(width: 400, height: 400) //added this to normalize picture within screen
                .animation(.default, value: imageName)
                
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are So Dope!",
                                "There is NONE like YOU!",
                                "You Are One of One!",
                                "You are Doing Amazing!",
                                "Who Betta Than?? Nobody!",
                                "Gorgeous!", "You Are Amazing!",
                                "GO YOU!!", "Truly Fantastic!",
                                "GOD GOT YOU!"]
                
                var messageNumber: Int
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                
                var imageNumber: Int
                
               repeat {
                    imageNumber = Int.random(in: 0...9)
                }  while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
