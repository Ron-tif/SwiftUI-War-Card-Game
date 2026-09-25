import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background-cloth")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Image("logo")

                    Spacer()

                    VStack(spacing: 30) {
                        NavigationLink {
                            GameView()
                        } label: {
                            Text("Play")
                                .font(.title2.bold())
                                .foregroundStyle(.white)
                                .padding()
                                .background(.red)
                                .clipShape(.capsule)
                        }

                        NavigationLink {
                            StatisticsView()
                        } label: {
                            Text("Statistics")
                                .font(.title2.bold())
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue)
                                .clipShape(.capsule)
                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
