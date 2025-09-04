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
    @State private var imageNumber = 0
    @State private var messageNum = 0
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
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are So Dope!",
                                "There is NONE like YOU!",
                                "You Are One of One!",
                                "You are Doing Amazing!",
                                "Who Betta Than?? Nobody!",
                                "Gorgeous!"]
                
                
                message = messages[messageNum]
                messageNum += 1
                
                if messageNum == messages.count {
                    messageNum = 0
                }
                
                
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
