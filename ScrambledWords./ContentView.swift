//
//  ContentView.swift
//  ScrambledWords.
//
//  Created by Soha Elgaly on 11/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State var letters: [Letter] = [
        Letter(id: 0 , text: "A"),
        Letter(id: 1, text: "R"),
        Letter(id: 2, text: "G"),
        Letter(id: 3, text: "N"),
        Letter(id: 4, text: "O"),
        Letter(id: 5, text: "E")
    ]
    @State  var guessedLetters: [Letter] = []
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack(spacing: 50) {
                    Text("Lets Play Together👻")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                        .monospaced()
                    VStack {
                        
                        Spacer()
                        Image("orange")
                            .resizable()
                            .frame(width: 100,height: 100)
                        
                        Spacer()
                        HStack {
                            
                            ForEach(Array(guessedLetters.enumerated()), id:\.1) {index, guessedLetter in
                                VStack {
                                    LetterView(letter: guessedLetter)
                                        .onTapGesture {
                                            guessedLetters.remove(at: index)
                                        }
                                    
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 25,height: 2)
                                }
                            }
                        }
                        .padding(.bottom,20)
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    
                    Text("Score: \(score)")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .padding(.top)
                    
                    HStack {
                        ForEach(Array(letters.enumerated()),id: \.1) {index, letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    if !letter.text.isEmpty {
                                        guessedLetters.append(letter)
                                        letters[index].text = ""
                                    }
                                }
                        }
                        
                    }
                    
                }
                
                
            }
        }
        
        
    }
 
}

#Preview {
    ContentView()
}

struct LetterView: View {
    let letter : Letter
    var body: some View {
    
        Text(letter.text)
                .font(.system(size: 15).weight(.semibold))
                .foregroundStyle(.white)
                .frame(width: 30,height: 30)
                .background(Color.white.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                
        
    }
}
