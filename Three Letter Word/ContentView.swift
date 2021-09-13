//
//  ContentView.swift
//  Three Letter Word
//
//  Created by Student on 9/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var letter = ""
    @State private var counter = 0
    @State private var selectedLetters = ["", "", ""]
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var body: some View {
        VStack {
            Text("Three Letter Word")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            Text("Tap the grey box to change the letter")
            CustomLetterBox(color: Color.gray, text: letter)
                .onTapGesture {
                    let position = alphabet.index(alphabet.startIndex, offsetBy: counter)
                    letter = String(alphabet[position])
                    counter += 1
                    if counter == alphabet.count {
                        counter = 0
                    }
                }
            Text("Tap red box to select the letter")
            HStack{
                ForEach(0..<3) { index in
                    CustomLetterBox(color: Color.red, text: selectedLetters[index])
                        .onTapGesture {
                            selectedLetters[index] = letter
                        }
                }
            }
        }
    }
}
struct CustomLetterBox: View {
    let color: Color
    let text: String
    var body: some View{
        ZStack{
            color
            Text(text)
                .font(.system(size: 90))
                .fontWeight(.heavy)
        }
        .frame(width: 120, height: 120, alignment: .center)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
