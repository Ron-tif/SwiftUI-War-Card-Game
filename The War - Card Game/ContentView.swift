import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State private var playerCard = "card11"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                //The logo
                Image("logo")
                Spacer()
                
                //Cards
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()
                //Button
                
                Button {
                    
                   dealCards()
                    
                    
                } label: {
                    Image("button")
                }
                
                
                Spacer()
                
                //Scores
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        Text(String(cpuScore))
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
    
    func dealCards() {
        //Randomise card values
        var playerValue = Int.random(in: 2...14)
        var cpuValue = Int.random(in: 2...14)
        
        //Update the card images
        playerCard = "card" + String(playerValue)
        cpuCard = "card" + String(cpuValue)
        
        //Calculate the score
        if playerValue > cpuValue {
            playerScore += 1
        } else if cpuValue > playerValue {
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }
        
        //Update the score labels
        
    }


}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
