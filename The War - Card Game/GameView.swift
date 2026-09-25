//
//  GameView.swift
//  The War - Card Game
//
//  Created by Roni on 2026-09-22.
//

import SwiftUI

struct GameView: View {
    @AppStorage("gamesPlayed") private var gamesPlayed = 0
    @AppStorage("gamesWon") private var gamesWon = 0
    @AppStorage("gamesLost") private var gamesLost = 0
    @AppStorage("bestWinStreak") private var bestWinStreak = 0
    @AppStorage("currentWinStreak") private var currentWinStreak = 0

    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var gameOver = false
    @State private var winnerText = ""

    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                Image("logo")

                Spacer()

                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }

                Spacer()

                if gameOver {
                    VStack(spacing: 16) {
                        Text(winnerText)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)

                        Button("Play Again") {
                            resetGame()
                        }
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .padding()
                        .background(.red)
                        .clipShape(.capsule)
                    }
                } else {
                    Button {
                        dealCards()
                    } label: {
                        Image("button")
                    }
                }

                Spacer()

                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)
                        Text(playerScore.formatted())
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        Text(cpuScore.formatted())
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)

                Spacer()
            }
            .padding()
        }
    }

    private func dealCards() {
        let playerValue = Int.random(in: 2...14)
        let cpuValue = Int.random(in: 2...14)

        playerCard = "card" + String(playerValue)
        cpuCard = "card" + String(cpuValue)

        if playerValue > cpuValue {
            playerScore += 1
        } else if cpuValue > playerValue {
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }

        if playerScore >= 5 {
            finishGame(playerWon: true)
        } else if cpuScore >= 5 {
            finishGame(playerWon: false)
        }
    }

    private func finishGame(playerWon: Bool) {
        gameOver = true
        gamesPlayed += 1

        if playerWon {
            winnerText = "Player Wins!"
            gamesWon += 1
            currentWinStreak += 1
            bestWinStreak = max(bestWinStreak, currentWinStreak)
        } else {
            winnerText = "CPU Wins!"
            gamesLost += 1
            currentWinStreak = 0
        }
    }

    private func resetGame() {
        playerCard = "back"
        cpuCard = "back"
        playerScore = 0
        cpuScore = 0
        gameOver = false
        winnerText = ""
    }
}

#Preview {
    GameView()
}
