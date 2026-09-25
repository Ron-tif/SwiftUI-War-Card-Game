//
//  LeaderboardView.swift
//  The War - Card Game
//
//  Created by Roni on 2026-09-23.
//

import SwiftUI

struct StatisticsView: View {
    @AppStorage("gamesPlayed") private var gamesPlayed = 0
    @AppStorage("gamesWon") private var gamesWon = 0
    @AppStorage("gamesLost") private var gamesLost = 0
    @AppStorage("bestWinStreak") private var bestWinStreak = 0
    @AppStorage("currentWinStreak") private var currentWinStreak = 0

    private var winRate: Int {
        guard gamesPlayed > 0 else {
            return 0
        }

        return Int((Double(gamesWon) / Double(gamesPlayed) * 100).rounded())
    }

    var body: some View {
        ZStack {
            Image("background-wood-grain")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Statistics")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                VStack(spacing: 0) {
                    statisticRow(title: "Games Played", value: gamesPlayed.formatted())
                    Divider()
                    statisticRow(title: "Games Won", value: gamesWon.formatted())
                    Divider()
                    statisticRow(title: "Games Lost", value: gamesLost.formatted())
                    Divider()
                    statisticRow(title: "Win Rate", value: "\(winRate)%")
                    Divider()
                    statisticRow(title: "Best Win Streak", value: bestWinStreak.formatted())
                }
                .background(.white, in: RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 8)

                Button("Reset Statistics", role: .destructive) {
                    resetStatistics()
                }
                .font(.headline)
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func statisticRow(title: LocalizedStringKey, value: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.title3)
        .foregroundStyle(.black)
        .padding()
    }

    private func resetStatistics() {
        gamesPlayed = 0
        gamesWon = 0
        gamesLost = 0
        bestWinStreak = 0
        currentWinStreak = 0
    }
}

#Preview {
    NavigationStack {
        StatisticsView()
    }
}
