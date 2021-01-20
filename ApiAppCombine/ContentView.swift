import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = HeroesViewModel()
    
    
     
    var body: some View {
        NavigationView {
            TabView {
                BBView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                        .navigationBarTitle("Герои фильма")
                        .foregroundColor(.gray)
                }
                
                List(viewModel.heroes) { hero in
                    VStack (alignment: .leading)  {
                        Text(hero.name)
                    }
                }
                .tabItem {
                    Image(systemName: "2.square.fill")
                }
            }
            .onAppear {
                viewModel.fetchHeroes()
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



