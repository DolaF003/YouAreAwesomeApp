//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Dola Fakeye on 8/25/25.
// 

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1 //lastMessageNumber will never be -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        
        let content: some View = VStack {
            Text(message)
                .font(.largeTitle) //changed the size
                .fontWeight(.heavy) //changed the boldness
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable() //stretches image out to ends of device
                .scaledToFit() //normalizes stretched out image (but still bigger than before)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .frame(width: 400, height: 400) //added this to normalize picture within screen
                .animation(.default, value: imageName)
                
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying{
                            audioPlayer.stop()
                            }
                        }
                
                Spacer()
                
                Button("Show Message") {
                    let messages = ["You Are So Dope!",
                                    "There is NONE like YOU!",
                                    "You Are One of One!",
                                    "You are Doing Amazing!",
                                    "Who Betta Than?? Nobody!",
                                    "Gorgeous!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
        }
        return content
        .padding()
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
       return newNumber
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview ("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview ("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
