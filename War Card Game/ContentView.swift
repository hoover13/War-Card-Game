//
//  ContentView.swift
//  War Card Game
//
//  Created by Hoover on 10/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerNumber = 0
    @State private var computerNumber = 0
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var isDealButtonTapped = false
    
    var body: some View {
        
        ZStack {
            Image("background")
               
            VStack {
            Spacer()
            Image("logo")
            Spacer()
            HStack {
                Spacer()
                if isDealButtonTapped {
                    Image("card\(playerNumber)")
                } else {
                    UnknownCardView()
                }
                
                Spacer()
                if isDealButtonTapped {
                    Image("card\(computerNumber)")
                } else {
                    UnknownCardView()
                }
               
                Spacer()
            }
            Spacer()
            Button {
                isDealButtonTapped = true
                playerNumber = Int.random(in: 2...14)
                computerNumber = Int.random(in: 2...14)
                
                if playerNumber > computerNumber {
                    playerScore += 1
                } else if computerNumber > playerNumber {
                    computerScore += 1
                }
                 
            } label: {
                Image("dealbutton")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Player")
                            .bold()
                        Text("\(playerScore)")
                            .font(.title)
                       
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        Text("CPU")
                            .bold()
                        Text("\(computerScore)")
                            .font(.title)
                    }
                    Spacer()
                }
              
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
}
 
struct UnknownCardView: View {
     
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.cyan)
                .frame(width: 120, height: 170)
                .cornerRadius(10)
                
            Text("?")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
