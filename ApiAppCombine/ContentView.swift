import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        NavControllerView(transition: .custom(.scale)) {
            TabView {
                BBView()
                    .tabItem {
                        Image(systemName: "1.square.fill")

                    }
                HeroView()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



